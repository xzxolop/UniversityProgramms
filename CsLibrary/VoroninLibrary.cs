using System;
using System.Diagnostics;
using System.Linq;
using System.Text.RegularExpressions;
using System.IO;
using System.Collections.Generic;
using static VoroninLibrary.VoroninProgramms;

namespace VoroninLibrary
{
    public static class VoroninProgramms
    {
        //##################################################################################################################
        //##################################################################################################################
        //БАЗОВЫЕ ФУНКЦИИ
        //##################################################################################################################
        //##################################################################################################################

        /// <summary>
        /// Печатает без переноса на следующую строчку
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="a"></param>
        public static void Print(params Object[] obj)
        {
            foreach (var item in obj)
                Console.Write($"{item} ");
        }

        /// <summary>
        /// Печатает с пересносом на следующую строчку
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="a"></param>
        public static void Println(params Object[] obj)
        {
            foreach (var item in obj)
                Console.Write($"{item} ");
            Console.WriteLine();
        }
        public static T Max<T>(T a, T b) where T : IComparable<T>
        {
            var max = a.CompareTo(b);
            if (max == -1) { return b; } else { return a; }
        }

        public static T Min<T>(T a, T b) where T : IComparable<T>
        {
            var max = a.CompareTo(b);
            if (max == -1) { return a; } else { return b; }
        }

        /// <summary>
        /// Печатает элементы массива в строчку
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="a"></param>
        public static void Print<T>(T[] a)
        {
            for (int i = 0; i < a.Length; i++)
                Console.Write($"{a[i]} {""}");
            Console.WriteLine();
        }

        public static void Println<T>(T[] a)
        {
            for (int i = 0; i < a.Length; i++)
                Console.WriteLine($"{a[i]} {""}");
            Console.WriteLine();
        }


        //##################################################################################################################
        //##################################################################################################################
        //МАССИВЫ И МАТРИЦЫ
        //##################################################################################################################
        //##################################################################################################################

        /// <summary>
        /// Удаляет элемент заданного индекса (функция)
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="ar"></param>
        /// <param name="ind"></param>
        /// <returns></returns>
        public static T[] ArrDelIndFuncion<T>(T[] ar, int ind)
        {
            T[] newAr = new T[ar.Length - 1];
            for (int i = 0; i < ind; i++)
                newAr[i] = ar[i];

            for (int i = ind + 1; i < ar.Length; i++)
                newAr[i - 1] = ar[i];

            return newAr;
        }

        /// <summary>
        /// Удаляет элемент заданного индекса (процедура)
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="ar"></param>
        /// <param name="ind"></param>
        public static void ArrDelIndProcedure<T>(ref T[] ar, int ind)
        {
            for (int i = ind + 1; i < ar.Length; i++)
            {
                ar[i - 1] = ar[i];
            }
            T[] newAr = new T[ar.Length - 1];
            for (int i = 0; i < ar.Length - 1; i++)
            {
                newAr[i] = ar[i];
            }
            ar = newAr;
        }

        /// <summary>
        /// Удаление всех эллементов равных T
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="ar">Массив</param>
        /// <param name="elem">Элемент</param>
        /// <returns></returns>
        public static T[] ArrDelSameElements<T>(ref T[] ar, T elem)
        {
            for (int i = ar.Length - 1; i >= 0; i--)
            {
                if (ar[i].Equals(elem))
                {
                    ArrDelIndProcedure(ref ar, i);
                }
            }
            return ar;
        }

        /// <summary>
        /// Удаление заданных элементов в целочислином массиве (лямбда-функция)
        /// </summary>
        /// <param name="array"></param>
        /// <param name="item"></param>
        /// <returns></returns>
        public static int[] ArrDelSameElementsLambda(int[] array, int item)
        {
            array = array.Where(e => e != item).ToArray();
            return array;
        }

        /// <summary>
        /// Меняет местами правую и левую части массива
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="ar"></param>
        /// <returns></returns>
        public static T[] ArrMiddleSwap<T>(T[] ar)
        {
            T[] newAr = new T[ar.Length];
            for (int i = 0; i <= ar.Length / 2 - 1; i++)
            {
                newAr[i] = ar[i + ar.Length / 2];
                newAr[i + ar.Length / 2] = ar[i];
            }
            return newAr;
        }

        /// <summary>
        /// Печатает матрицу (двумерный массив)
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="matr"></param>
        public static void Print<T>(T[,] matr)
        {
            for (int i = 0; i < matr.GetLength(0); i++)
            {
                for (int j = 0; j < matr.GetLength(1); j++)
                {
                    Console.Write($"{matr[i, j]} {""}");
                }
                Console.WriteLine();
            }
        }

        /// <summary>
        /// Сумма побочной горизонтали матрицы
        /// </summary>
        /// <param name="matr"></param>
        /// <returns></returns>
        public static int MatrSumSecondaryHorizontal(int[,] matr)
        {
            Debug.Assert(matr.GetLength(0) == matr.GetLength(1));
            int sum = 0;
            for (int i = matr.GetLength(0) - 1; i > -1; i--)
            {
                sum += matr[i, i];
            }
            return sum;
        }

        /// <summary>
        /// Сумма и произведение элементов столбца К
        /// </summary>
        /// <param name="matr"></param>
        /// <param name="K"></param>
        /// <param name="sum"></param>
        /// <param name="prod"></param>
        public static void MatrSumAndProdStolb(double[,] matr, int K, out double sum, out double prod)
        {
            Debug.Assert((1 <= K) && (K <= matr.GetLength(1)));
            sum = 0.0;
            prod = 1.0;
            for (int i = 0; i < matr.GetLength(0); i++)
            {
                sum += matr[i, K];
                prod *= matr[i, K];
            }
        }

        /// <summary>
        /// Формирует целочисленную матрицу размера M × N, у которой все элементы J-го столбца имеют значение X·J (J = 1, …, N), где X — тоже параметр подпрограммы.
        /// </summary>
        /// <param name="M"></param>
        /// <param name="N"></param>
        /// <param name="X"></param>
        /// <returns></returns>
        public static int[,] MatrCreate(int M, int N, int X)
        {
            Debug.Assert((M > 0) && (N > 0));
            int[,] matr = new int[M, N];
            int cnt = 1;
            for (int i = 0; i < matr.GetLength(0); i++)
            {

                for (int j = 0; j < matr.GetLength(1); j++)
                {
                    matr[i, j] = cnt * X;
                }
                cnt += 1;
            }
            return matr;
        }

        /// <summary>
        /// Даны целые положительные числа M, N, число D и набор из M чисел(массив). Сформировать матрицу размера M × N, у которой первый столбец совпадает с исходным набором чисел, а элементы каждого следующего столбца равны сумме соответствующего элемента предыдущего столбца и числа D (в результате каждая строка матрицы будет содержать элементы арифметической прогрессии).
        /// </summary>
        /// <param name="M"></param>
        /// <param name="N"></param>
        /// <param name="D"></param>
        /// <param name="ar"></param>
        /// <returns></returns>
        public static int[,] MatrCreate2(int M, int N, int D, int[] ar)
        {
            Debug.Assert((M > 0) && (N > 0));
            Debug.Assert(ar.Length == M);
            int[,] matr = new int[M, N];
            for (int i = 0; i < matr.GetLength(0); i++)
            {
                for (int j = 0; j < matr.GetLength(1); j++)
                {
                    matr[j, i] = ar[j] + (D * i);
                }
            }
            return matr;
        }

        /// <summary>
        /// Выводит элементы матрицы в следующем порядке: первая строка слева направо, вторая строка справа налево, третья строка слева направо, четвертая строка справа налево и т. д.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="matr"></param>
        public static void PrintMatrRevered<T>(T[,] matr)
        {
            int i = 0;
            for (int ban = 0; ban < matr.GetLength(0); ban++)
            {
                for (int j = 0; j < matr.GetLength(1); j++)
                {
                    Console.Write($"{matr[i, j]} {""}");
                }
                i++;
                Console.WriteLine();
                if (i > matr.GetLength(0) - 1) break;

                for (int j = matr.GetLength(1) - 1; j > -1; j--)
                {
                    Console.Write($"{matr[i, j]} {""}");
                }
                i++;
                Console.WriteLine();
                if (i > matr.GetLength(0) - 1) break;
            }
        }

        /// <summary>
        /// Среднее арифмитическое элементов нечётных строк 
        /// </summary>
        /// <param name="matr"></param>
        public static void MatrArithmeticMeanOfOddStr(int[,] matr)
        {
            for (int i = 0; i < matr.GetLength(0); i += 2)
            {
                int SumStolb = 0;
                for (int j = 0; j < matr.GetLength(1); j++)
                {
                    SumStolb += j;
                }
                SumStolb = SumStolb / (matr.GetLength(1) - 1);
                Console.Write($"{"Среднее арифметическое столбца №"}{i + 1} ");
                Println(SumStolb);
            }
        }

        /// <summary>
        /// Печатает номер строки матрицы с наибольшей суммой элементов и данный номер, а также значение наибольшей суммы.
        /// </summary>
        /// <param name="matr"></param>
        public static void PrintMaxSumOfStrMatr(int[,] matr)
        {
            int max = int.MinValue;
            int numbStr = 0;
            for (int i = 0; i < matr.GetLength(0); i++)
            {
                int sumStr = 0;
                for (int j = 0; j < matr.GetLength(1); j++)
                {
                    sumStr += matr[i, j];
                }
                if (sumStr > max)
                {
                    max = sumStr;
                    numbStr = i + 1;
                }
            }
        }

        /// <summary>
        /// Добавление элемента в коннец массива с увеличением длины массива на 1
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="ar">Массив</param>
        /// <param name="elem">Элемент который добавляем</param>
        public static void ArrAddElem<T>(ref T[] ar, T elem)
        {
            Array.Resize(ref ar, ar.Length + 1);
            ar[ar.Length - 1] = elem;
        }

        //##################################################################################################################
        //##################################################################################################################
        //СТРОКИ, РЕГУЛЯРНЫЕ ВЫРАЖЕНИЯ
        //##################################################################################################################
        //##################################################################################################################
        public static bool StrIsRostovTelNumb(string a)
        {
            return (Regex.IsMatch(a, @"^\+7 \(863\) [23]\d{2}-\d{2}-\d{2}$"));
        }

        //Написать функцию, которая по заданному телефонному номеру в федеральном формате(+7 (код_города) городской_номер) возвращает городской телефонный номер.Считать, что код города может состоять из трёх или четырёх цифр. Если исходная строка не соответствует заданному формату, возвращать пустую строку.
        //Указание: в этой задаче потребуется группировать символы регулярного выражения. 
        /// <summary>
        /// Преобразует телефонный номер в городской
        /// </summary>
        /// <param name="a"></param>
        /// <returns></returns>
        public static string StrConvertPhoneNumbToCityNumb(string a)
        {
            Match tel = Regex.Match(a, @"^\+7 \(\d{3,4}\) (\d{3}-\d{2}-\d{2}$)");
            if (tel.Success)
                return tel.Groups[1].Value;
            else return "Ошибка";
        }

        /// <summary>
        /// Функция, которая определяет количество входящих в заданную строку почтовых индексов(почтовый индекс состоит из 6 цифр).
        /// </summary>
        /// <param name="a"></param>
        /// <returns></returns>
        public static int StrCountOfPostcode(string a)
        {
            MatchCollection ban = Regex.Matches(a, @"(\d{6})");
            return ban.Count;
        }


        /// <summary>
        /// Дана строка — предложение на русском языке. Меняет местами первую и последнюю буквы каждого слова. 
        /// </summary>
        /// <param name="a"></param>
        /// <returns></returns>
        public static string StrSwapFirstAndLastLettersInWords(string a)
        {
            return Regex.Replace(a, @"\b(\w{0,1})(\w*)(\w{1})\b", @"$3$2$1");
        }


        /// <summary>
        /// Дана строка. Функция считает, сколько смайликов в ней содержится.
        ///Смайликом будем считать последовательность символов, удовлетворяющую условиям:
        ///первым символом является либо; (точка с запятой) либо : (двоеточие) ровно один раз
        ///далее может идти символ - (минус) сколько угодно раз(в том числе символ минус может идти ноль раз)
        ///в конце обязательно идет некоторое количество(не меньше одной) одинаковых скобок из следующего набора: (, ), [,].
        /// внутри смайлика не может встречаться никаких других символов.
        /// </summary>
        /// <param name="a"></param>
        /// <returns></returns>
        public static int StrCountOfSmiles(string a)
        {
            var ban = Regex.Matches(a, @"[:,;]{1}-*[\[\]\(\)]+");
            return ban.Count;
        }


        //ДОМАШНЕЕ ЗАДАНЕЕ №3
        /// <summary>
        /// Удаляет в строке элемент под заданым индексом, заменяя его на заданую строку. (Функция)
        /// </summary>
        /// <param name="str">Строка в которой будет произведена замена</param>
        /// <param name="replacement">На что заменяем</param>
        /// <param name="ind">Индекс элемента строки который будет заменен</param>
        public static string StrElemReplaceFunc(string str, string replacement, int ind)
        {
            string word1 = "";
            string word2 = "";
            for (int i = 0; i < ind; i++)
            {
                word1 += str[i];
            }

            for (int i = ind + 1; i < str.Length; i++)
            {
                word2 += str[i];
            }
            return word1 + replacement + word2;
        }

        /// <summary>
        /// Удаляет в строке элемент под заданым индексом, заменяя его на заданую строку. (Процедура)
        /// </summary>
        /// <param name="str">Строка в которой будет произведена замена</param>
        /// <param name="replacement">На что заменяем</param>
        /// <param name="ind">Индекс элемента строки который будет заменен</param>
        public static void StrElemReplaceVoid(ref string str, string replacement, int ind)
        {
            string word1 = "";
            string word2 = "";
            for (int i = 0; i < ind; i++)
            {
                word1 += str[i];
            }

            for (int i = ind + 1; i < str.Length; i++)
            {
                word2 += str[i];
            }
            str = word1 + replacement + word2;
        }

        /// <summary>
        /// Добавляет элемент в строку
        /// </summary>
        /// <param name="str"></param>
        /// <param name="add"></param>
        /// <param name="ind"></param>
        /// <returns></returns>
        public static string StrAddElem(string str, string add, int ind)
        {
            string word1 = str.Substring(0, ind);
            string word2 = str.Substring(ind + 1);
            return word1 + add + word2;
        }

        /// <summary>
        /// Находит колличество элементов (char) в строке
        /// </summary>
        /// <param name="s">Строка в которой будет проходить поиск</param>
        /// <param name="c">Элемент который ищем</param>
        /// <returns></returns>
        public static int StrCountOf(string s, char c)
        {
            int sum = 0;
            for (int i = 0; i < s.Length; i++)
            {
                if (s[i] == c) sum++;
            }
            return sum;
        }

        /// <summary>
        /// Срез строки
        /// </summary>
        /// <param name="s">Строка которая будет срезана</param>
        /// <param name="firstInd">Индекс (считать с нуля) с которого обрезаем (включительно) </param>
        /// <param name="LastInd">Индекс до которого обрезаем (не включительно)</param>
        /// <returns></returns>
        public static string StrDelIndToIndFunc(string s, int firstInd, int LastInd)
        {
            string NewS = "";
            for (int i = 0; i < firstInd; i++)
            {
                NewS += s[i];
            }
            for (int i = LastInd; i < s.Length; i++)
            {
                NewS += s[i];
            }
            return NewS;
        }

        /// <summary>
        /// Поиск первого и последнего индекса слова в строке
        /// </summary>
        /// <param name="a">Строка</param>
        /// <param name="b">Слово</param>
        /// <returns>int[] Возвращяет целочисленый массив с двумя элементами: Первый - перый (0) индекс начала слова в стрке, Второй - последний индекс слова в строке.</returns>
        public static int[] StrFindFirsAndLastIndOfWord(string s, string word)
        {
            int[] IndAr = new int[0];
            for (int i = 0; i < s.Length - word.Length + 1; i++)
            {
                if (word[0] == s[i])
                {
                    var newA = s.Substring(i, word.Length);
                    if (newA == word)
                    {
                        ArrAddElem(ref IndAr, i);
                        ArrAddElem(ref IndAr, i + word.Length - 1);
                    }
                }
            }
            return IndAr;
        }

        /// <summary>
        /// Выводит на консоль все найденные российские автомобильные гос. номера в строке a. (Процедура) 
        /// </summary>
        /// <param name="a">Строка в которой будет проходить поиск автомобильных номеров</param>
        public static void StrAutoNumbRusVoid(string a)
        {
            MatchCollection num = Regex.Matches(a, @"([авекмнорстух][авекмнорстух]\d{3}[авекмнорстух] \d{2,3})");
            foreach (Match m in num)
            {
                Print(m.Groups[0]);
                Print(", ");
            }
            Println("");
        }

        /// <summary>
        /// Выводит на консоль все найденные российские автомобильные гос. номера в строке a. (Функция) 
        /// </summary>
        /// <param name="a">Строка в которой будет проходить поиск автомобильных номеров</param>
        public static string StrAutoNumbRusFunc(string a)
        {
            string res = "";
            MatchCollection num = Regex.Matches(a, @"([авекмнорстух][авекмнорстух]\d{3}[авекмнорстух] \d{2,3})");
            foreach (Match m in num)
            {
                res += m.Groups[0] + ",";
            }
            string newRes = "";
            for (int i = 0; i < res.Length - 1; i++)
            {
                newRes += res[i];
            }
            return newRes;
        }
        /// <summary>
        /// Создаёт текстовый файл и записывает в него Айпишники формата IPv4. После следующего вызова программы файл будет удалён. 
        /// </summary>
        /// <param name="a">Строка в которой будет проходить поиск IpV4</param>
        /// <param name="path">Путь и имя создаваемого файла. Пример:"C:\\Users\\user\\Desktop\\1.16.5\\ban.txt"</param>
        public static void StrIPv4(string a, string path)
        {
            File.Create(path).Close();
            MatchCollection matches = Regex.Matches(a, @"\b(?:\d{1,3}\.){3}\d{1,3}\b");
            foreach (Match match in matches)
            {
                File.AppendAllText(path, match.Value + "\n");
                Println(match.Value);
            }
        }

        /// <summary>
        /// Создаёт текстовый файл и записывает в него Айпишники формата IPv4. После следующего вызова программы файл НЕ будет удалён. 
        /// </summary>
        /// <param name="a">Строка в которой будет проходить поиск IpV4</param>
        /// <param name="path">Путь и имя создаваемого файла. Пример:"C:\\Users\\user\\Desktop\\1.16.5\\ban.txt"</param>
        public static void StrIPv4noDel(string a, string path)
        {
            File.AppendAllText(path, "НОВЫЙ ВЫЗОВ ФУНКЦИИ" + "\n");
            MatchCollection matches = Regex.Matches(a, @"\b(?:\d{1,3}\.){3}\d{1,3}\b");
            foreach (Match match in matches)
            {
                File.AppendAllText(path, match.Value + "\n");
                Println(match.Value);
            }
        }

        /// <summary>
        /// Преобразовает текст, обрамленный в звездочки, в текст обрамленный тегом <em></em>. Текст обрамленный двумя и более звёздочками не трогает.
        /// </summary>
        /// <param name="a">Строка которая будет преобразована</param>
        /// <returns></returns>
        public static string StrStarReplaceToEmV1(string a)
        {
            if (!(Regex.IsMatch(a, @"\*{2}(.{0,})\*{2}")))
                a = Regex.Replace(a, @"\*{1}(.{0,})\*{1}", "<em>$1<em>");
            return a;
        }

        /// <summary>
        /// Преобразовает текст, обрамленный в звездочки, в текст обрамленный тегом <em></em>. Текст обрамленный двумя и более звёздочками не трогает.
        /// </summary>
        /// <param name="a">Строка которая будет преобразована</param>
        /// <returns></returns>
        public static string StrStarReplaceToEmV2(string a)
        {
            int[] ind = new int[0];
            string NewA = a;
            foreach (Match match in Regex.Matches(a, @"(\*+\w+[\w\s]+\*+)"))
            {
                if (VoroninProgramms.StrCountOf(match.Value, '*') == 2)//&& match.Value[0]== '*' && match.Value[match.Value.Length-1] == '*')
                {
                    var matchValue = match.Value;
                    var rgx = new Regex(@"\*");
                    matchValue = rgx.Replace(matchValue, "<em>", 1);
                    matchValue = rgx.Replace(matchValue, "</em>", 1);
                    ind = VoroninProgramms.StrFindFirsAndLastIndOfWord(NewA, match.Value); //перезаписываем массив каждый раз
                    NewA = VoroninProgramms.StrDelIndToIndFunc(NewA, ind[0], ind[1]);
                    VoroninProgramms.StrElemReplaceVoid(ref NewA, matchValue, ind[0]);
                }
            }
            return NewA;
        }

        /// <summary>
        /// Проверяет является ли строка ссылкой формата http(s)//....com/ru/...
        /// </summary>
        /// <param name="a"></param>
        /// <returns></returns>
        public static bool StrIsHttp(string a)
        {
            var Match = Regex.Matches(a, @"(http[s]{0,1}[:][/]{2}\w+[.]\w+)");
            return Match.Count != 0;
        }

        //##################################################################################################################
        //##################################################################################################################
        //Файлы, Бинарные Файлы
        //##################################################################################################################
        //##################################################################################################################

        public static void PrintBinFileDouble(string path)
        {
            using (var fs = File.Open(path, FileMode.Open))
            using (var br = new BinaryReader(fs))
            {
                var sz = br.BaseStream.Length / sizeof(double);
                for (var i = 0; i < sz; i++)
                {
                    Console.Write(br.ReadDouble());
                    Console.Write(" ");
                }
                Console.WriteLine("");
            }
        }
        public static void PrintBinFileInt32(string path)
        {
            using (var fs = File.Open(path, FileMode.Open))
            using (var br = new BinaryReader(fs))
            {
                var sz = br.BaseStream.Length / sizeof(Int32);

                for (var i = 0; i < sz; i++)
                {
                    Console.Write(br.ReadInt32());
                    Console.Write(" ");
                }
                Println("");
            }
        }

        public static void FileBinCreateArr(string name, params Int32[] ar)
        {
            using (var fs = new FileStream(name, FileMode.Create))
            using (var bw = new BinaryWriter(fs))
            {
                try
                {
                    for (int i = 0; i < ar.Length; i++)
                    {
                        bw.Write(ar[i]);
                    }
                }
                catch (Exception ex)
                {
                    Print("Ошибка"); Print(""); Print(ex.Message);
                }
            }
        }

        public static void FileBinCreateArr(string name, params double[] ar)
        {
            using (var fs = new FileStream(name, FileMode.Create))
            {
                using (var bw = new BinaryWriter(fs))
                {
                    try
                    {
                        for (int i = 0; i < ar.Length; i++)
                        {
                            bw.Write(ar[i]);
                        }
                    }
                    catch (Exception ex)
                    {
                        Print("Ошибка"); Print(""); Print(ex.Message);
                    }
                }
            }
        }

        public static void FileCreate(string path)
        {
            File.Create(path).Close();
        }

        /// <summary>
        /// Создаёт вроде как бинарный файл, заполненым рандомными числами.
        /// </summary>
        /// <param name="name">Название файла</param>
        /// <param name="n">Количество элементов в файле</param>
        /// <param name="a">Минимальное возможное число в файле</param>
        /// <param name="b">Максимальное возможное число в файле</param>
        public static void CreateBinFileDoubleRandom(string name, int n = 20, int a = -50, int b = 50)
        {
            Debug.Assert((b >= a) && (n >= 0));
            using (var fs = new FileStream(name, FileMode.Create))
            using (var bw = new BinaryWriter(fs))
            {
                try
                {
                    var random = new Random();
                    int rnd;
                    for (int i = 0; i < n; i++)
                    {
                        rnd = random.Next(a, b);
                        bw.Write(Convert.ToDouble(rnd));
                    }
                }
                catch (Exception ex)
                {
                    Print("Ошибка"); Print(""); Print(ex.Message);
                }
            }
        }

        /// <summary>
        /// Выводит на консоль элемент бинарного файла
        /// </summary>
        /// <param name="path">Название файла</param>
        /// <param name="k">Элемент, который будет распечатан</param>
        public static int FindBinPrintElem(string path, int k)
        {
            Debug.Assert(k > 0);
            int cnt = 0;
            using (var fs = File.Open(path, FileMode.Open))
            using (var br = new BinaryReader(fs))
            {
                try
                {
                    for (var i = 0; i < k; i++)
                    {
                        cnt = br.ReadInt32();
                    }
                    return cnt;
                }
                catch
                {
                    Println("Ошибка: Такого эл-та не существует");
                    return -1;
                }
            }
        }

        public static void FileCreateFromTwoFileWithMaxDouble(string path1, string path2, string path3)
        {
            using (var fs1 = File.Open(path1, FileMode.Open))
            using (var fs2 = File.Open(path2, FileMode.Open))
            using (var br1 = new BinaryReader(fs1))
            using (var br2 = new BinaryReader(fs2))
            {
                var sz1 = br1.BaseStream.Length / sizeof(Double);
                var sz2 = br2.BaseStream.Length / sizeof(Double);
                var len = VoroninProgramms.Min(sz1, sz2);

                using (var fs3 = new FileStream(path3, FileMode.Create))
                {
                    using (var bw = new BinaryWriter(fs3))
                    {
                        for (var i = 0; i < len; i++)
                        {
                            var max = VoroninProgramms.Max(br1.ReadDouble(), br2.ReadDouble());
                            bw.Write(max);
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Среднее арифмитическое положительных чисел в файле
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        public static double FileBinArithmeticMeanOfPositiveNumbers(string path)
        {
            using (var fs = new FileStream(path, FileMode.Open))
            using (var br = new BinaryReader(fs))
            {
                double sum = 0;
                int cntPosNumb = 0;
                var sz = br.BaseStream.Length / sizeof(Double);
                for (int i = 0; i < sz; i++)
                {
                    var numb = br.ReadDouble();
                    if (numb > 0)
                    {
                        sum += numb;
                        cntPosNumb++;
                    }
                }
                return sum / cntPosNumb;
            }
        }

        public static void PrintBinFileInt32Reversed(string path)
        {
            using (var fs = File.Open(path, FileMode.Open))
            using (var br = new BinaryReader(fs))
            {

                var sz = br.BaseStream.Length / sizeof(Int32);
                var len = sz;

                for (var i = sz - 1; i > -1; i--)
                {
                    fs.Seek(i * 4, SeekOrigin.Begin);//Умножаем на четыре т.к. SizeOf(int32)=4 bit
                    Print(br.ReadInt32());
                    Print(" ");
                    len++;
                }
                Println("");
            }
        }

        /// <summary>
        /// Удаляет вторую половитну бинарного файла из двоичных чисел
        /// </summary>
        /// <param name="path"></param>
        public static void FileBinDoubleDelSecond(string path)
        {
            using (var fs = new FileStream(path, FileMode.Open))
            {
                var sz = fs.Length / sizeof(double);
                fs.Seek(sz * sizeof(double) / 2, SeekOrigin.Begin);
                fs.SetLength(fs.Position);
            }
        }

        public static int[] FileBinMax(string path)
        {
            int[] res = new int[2];
            int max = int.MinValue;
            int cnt = 0;
            using (var fs = new FileStream(path, FileMode.Open))
            using (var br = new BinaryReader(fs))
            {
                var sz = fs.Length / sizeof(Int32);
                for (int i = 0; i < sz; i++)
                {
                    cnt = br.ReadInt32();
                    if (cnt > max) { max = cnt; res[0] = i; }
                }
                res[1] = max;
            }
            return res;
        }

        public static int[] FileBinMin(string path)
        {
            int[] res = new int[2];
            int min = int.MaxValue;
            int cnt = 0;
            using (var fs = new FileStream(path, FileMode.Open))
            using (var br = new BinaryReader(fs))
            {
                var sz = fs.Length / sizeof(Int32);
                for (int i = 0; i < sz; i++)
                {
                    cnt = br.ReadInt32();
                    if (cnt < min) { min = cnt; res[0] = i; }
                }
                res[1] = min;
            }
            return res;
        }

        public static void BinDoubleDelSecond(string path)
        {
            using (var fs = new FileStream(path, FileMode.Open))
            {
                var sz = fs.Length / sizeof(double);
                fs.Seek(sz * sizeof(double) / 2, SeekOrigin.Begin);
                fs.SetLength(fs.Position);
            }
        }


        public static void FileBinMax(string path, out int ind, out int max)
        {
            max = int.MinValue;
            ind = 0;
            int cnt = 0;
            using (var fs = new FileStream(path, FileMode.Open))
            using (var br = new BinaryReader(fs))
            {
                var sz = fs.Length / sizeof(Int32);
                for (int i = 0; i < sz; i++)
                {
                    cnt = br.ReadInt32();
                    if (cnt > max) { max = cnt; ind = i; }
                }
            }
        }

        public static void FileBinMin(string path, out int ind, out int min)
        {
            min = int.MinValue;
            ind = 0;
            int cnt = 0;
            using (var fs = new FileStream(path, FileMode.Open))
            using (var br = new BinaryReader(fs))
            {
                var sz = fs.Length / sizeof(Int32);
                for (int i = 0; i < sz; i++)
                {
                    cnt = br.ReadInt32();
                    if (cnt > min) { min = cnt; ind = i; }
                }
            }
        }

        public static void FileBinSwapMinMaxInt32(string path)
        {
            int max; int indMax; int min; int indMin;
            FileBinMax("task2", out indMax, out max);
            FileBinMax("task2", out indMin, out min);


            using (var fs = File.Open(path, FileMode.Open))
            using (var bw = new BinaryWriter(fs))
            {
                var sz = fs.Length / sizeof(Int32);
                fs.Seek(indMax * sizeof(Int32), SeekOrigin.Begin);
                bw.Write(min);
                fs.Seek(indMin * sizeof(Int32), SeekOrigin.Begin);
                bw.Write(max);
            }
        }

        public static void FileBinDelElemInt32(string path, int ind)
        {
            using (var fs = File.Open(path, FileMode.Open))
            using (var bw = new BinaryWriter(fs))
            using (var br = new BinaryReader(fs))
            {
                var sz = fs.Length / sizeof(Int32);
                fs.Seek(ind * sizeof(Int32), SeekOrigin.Begin);
                Int32 cnt = 0;
                for (int i = ind; i < sz; i++)
                {
                    cnt = br.ReadInt32();
                    fs.Seek(-sizeof(Int32) * 2, SeekOrigin.Current);
                    bw.Write((Int32)cnt);
                    fs.Seek(sizeof(Int32), SeekOrigin.Current);
                }
                fs.Seek(-sizeof(Int32), SeekOrigin.End);
                fs.SetLength(fs.Position);
            }
        }

        public static void FilePrintSumbols(string path)
        {
            int sc;
            using (var sr = new StreamReader(path))
            {
                while (!sr.EndOfStream)
                {
                    sc = sr.Read();
                    int a = (char)sc;
                    VoroninProgramms.Println("Символ:", (char)sc, "Код:", sc);
                }
            }
        }


        public static void FileCntOfEmptyStr(string path)
        {
            using (var sr = new StreamReader(path))
            {
                Int16 cnt = 0;
                while (!sr.EndOfStream)
                {
                    if (sr.ReadLine() == "")
                        cnt++;
                }
                Console.WriteLine(cnt);
            }
        }

        public static int ArrStrSumInt(string[] a)
        {
            int sum = 0;
            for (int i = 0; i < a.Length; i++)
            {
                if (String.IsNullOrWhiteSpace(a[i]) == false)
                {
                    sum += Convert.ToInt32(a[i]);
                }
            }
            return sum;
        }

        public static int FileSumInt(string path)
        {
            using (var sr = new StreamReader(path))
            {
                string line;
                int sum = 0;
                while (!sr.EndOfStream)
                {
                    line = sr.ReadLine();
                    if (line != "")
                    {
                        var a = Regex.Split(line, @"\s+");
                        sum += ArrStrSumInt(a);
                    }
                }
                return (sum);
            }
        }

        public static void FileTxtCreateArr(string path, params object[] a)
        {
            using (var sr = new StreamWriter(path))
            {
                for (int i = 0; i < a.Length; i++)
                {
                    sr.Write(a[i]);
                }
            }
        }

        public static void PrintTxtFile(string path)
        {
            string line;
            using (var sr = new StreamReader(path))
            {
                while (!sr.EndOfStream)
                {
                    line = sr.ReadLine();
                    foreach (var x in line)
                    {
                        Console.Write(x);
                    }
                    Console.WriteLine();
                }
            }
        }

      

        //1
        public static int FileTxtCountOfCodeEl(string path, int CodeElem)
        {
            int cnt = 0;
            using (var sr = new StreamReader(path))
            {
                while (!sr.EndOfStream)
                {
                    int el = sr.Read();
                    if (el == CodeElem) { cnt++; }
                }
            }
            return cnt;
        }

        //2
        public static void FileTxtCreateTwoDigitTnt(string path, Int16 k)
        {
            using (var sr = new StreamWriter(path))
            {

                Int16 perenos = 0;
                for (Int16 i = 10; i < 100; i++)
                {
                    sr.Write(i);
                    perenos++;
                    if (perenos == k)
                    {
                        sr.Write('\n');
                        perenos = 0;
                    }
                }
            }
        }

        //3
        public static int FileTxtCountOfRedStr(string path)
        {
            int cnt = 0;
            using (var sr = new StreamReader(path))
            {
                string line;
                while (!sr.EndOfStream)
                {
                    line = sr.ReadLine();
                    var ban = Regex.IsMatch(line, @"\A\s{5}\S");
                    if (ban == true) { cnt++; }
                }
            }
            return cnt;
        }

        //4
        public static int FileTxtCountOf(string path)
        {
            int cnt = 0;
            using (var sr = new StreamReader(path))
            {
                string line1 = sr.ReadLine();
                string line;
                while (!sr.EndOfStream)
                {
                    line = sr.ReadLine();
                    var ban = Regex.IsMatch(line1, line);
                    if (ban == true) { cnt++; }
                }
            }
            return cnt;
        }

        //5
        public static int FileTxtMaxInt32(string path)
        {
            int cnt = int.MinValue;
            int num;
            using (var sr = new StreamReader(path))
            {
                var ArEl = Regex.Split(sr.ReadToEnd(), @"\s+");
                for (int i = 0; i < ArEl.Length; i++)
                {
                    if (int.TryParse(ArEl[i], out num) == true)
                    {
                        if (cnt < num) cnt = num;
                    }
                }
            }
            return cnt;
        }

        //6
        public static int FileTxtCountOfWords(string path)
        {
            int el1;
            int el2;
            int cnt = 0;
            using (var sr = new StreamReader(path))
            {
                while (!sr.EndOfStream)
                {
                    el1 = sr.Read();
                    el2 = sr.Read();
                    Console.WriteLine(sr.BaseStream.Position);
                    if ((el1 != 32 && el1 != 13 && el1 != 10) && (el2 == 32 || el2 == 13 || el2 == 10))
                    {
                        cnt++;


                    }
                    // reader.BaseStream.Seek(0, SeekOrigin.Begin);
                    if (sr.EndOfStream)
                    {
                        break;
                    }

                }
            }
            return cnt;
        }

        public static int FileTxtCntOfEmptyStr(string path)
        {
            int cnt = 0;
            using (var sr = new StreamReader(path))
            {
                while (!sr.EndOfStream)
                {
                    if (sr.ReadLine() == "")
                        cnt++;
                }
            }
            return cnt;
        }

        public static int FileTxtCntOfEmptyStrV2(string path)
        {
            int cnt = 0;
            foreach (var line in File.ReadLines(path))
            {
                if (line == "")
                {
                    cnt++;
                }
            }
            return cnt;
        }

        public static int[] FileCsvSumNumOfStr(string path)
        {
            int sum = 0;
            int cnt = 0;
            var mas = File.ReadAllLines(path);
            int[] res = new int[mas.Length];
            foreach (var line in File.ReadLines(path))
            {
                var a = Regex.Split(line, @"[,\s]+");
                for (int i = 0; i < a.Length; i++)
                {
                    sum += Convert.ToInt32(a[i]);

                }
                cnt++;
                res[cnt - 1] = sum;
            }
            return res;
        }

        public static void FileTxtCatalogCreate(string path)
        {
            string[] pathBan = Directory.GetFiles(path);
            VoroninProgramms.Print(pathBan);
            for (int i = 0; i < pathBan.Length; i++)
            {
                var fileName = (System.IO.Path.GetDirectoryName(pathBan[i]));
                var NewFileName = "help-" + fileName;
                //.File.Move

            }

        }

        /// <summary>
        /// Дан текстовый файл. Заменить в нем все подряд идущие пробелы на один пробел.
        /// </summary>
        /// <param name="path"></param>
        public static void FileTxtDelSpaces(string path)
        {
            string file;
            using (var sr = new StreamReader(path))
            {
                file = sr.ReadToEnd();

            }
            for (int i = file.Length - 1; i > 1; i--)
            {
                if (file[i] == ' ' && file[i - 1] == ' ')
                {
                    VoroninProgramms.StrElemReplaceVoid(ref file, "", i);

                }
            }
            File.WriteAllText(path, file);
        }

        ///////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////
        //КЛАССЫ
        ///////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////



        ///////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////
        //Динам. структуры данных
        ///////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////////////////////////

        /// <summary>
        /// Создает односвязный список с помощью массива и возвращает ссылку на его первый элемент
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="elems"></param>
        /// <returns></returns>
        public static LinkedListNode<T> CreateListNode<T>(params T[] elems)
        {
            if ((elems == null) || (elems.Length == 0))
                return null;
            var l = new LinkedList<T>(elems);
            return l.First;
        }

        /// <summary>
        /// Создает односвязный список с помощью массива
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="elems"></param>
        /// <returns></returns>
        public static LinkedList<T> CreateList<T>(params T[] elems)
        {
            if ((elems == null) || (elems.Length == 0))
                return null;
            var l = new LinkedList<T>(elems);
            return l;
        }

        /// <summary>
        /// Печатает список
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="lst"></param>
        public static void Print<T>(LinkedList<T> lst)
        {
            foreach(var x in lst)
            {
                Console.Write($"{x} ");
            }
            Console.WriteLine();
        }

        public class VorLinkedList<T>
        {
            public T Value { get; set; }
            public VorLinkedList<T> Next { get; set; }
            public VorLinkedList<T> First { get; set; }
            public VorLinkedList(T Value, VorLinkedList<T> Next)
            {
                this.Value = Value;
                this.Next = Next;
                this.First = this;
            }
            public void Print()
            {
                if (this.First == null)
                    return;
                else
                {
                    Console.Write($"{this.Value} ");

                    if (this.Next != null)
                    {
                        this.Next.Print();
                    }
                }
            }

            public void Println()
            {
                Print();
                Console.WriteLine();
            }

        }

        public static double SumNumbPred(double A, double B, double h, Func<double, bool> pred)
        {
            if (A > B)
            {
                return 0;
            }
            double sum = 0;
            if (pred(A))
            {
                sum += A;
            }
            return sum + SumNumbPred(A + h, B, h, pred);

        }

        public static double Task1Proverka(double A, double B, double h, Func<double, bool> pred)
        {
            double sum = 0.0;
            int cnt = 0;
            for (var i = A; i <= B; i++)
            {
                if (pred(A + h * cnt))
                {
                    sum += A + h * cnt;
                }
                cnt++;
            }
            return sum;
        }


        //2
        public static bool IsPolindrome(string s)
        {
            if (s == null)
            {
                return true;
            }

            if (s.Length <= 1)
            {
                return true;
            }

            if (s[0] != s[s.Length - 1])
            {
                return false;
            }
            return IsPolindrome(s.Substring(1, s.Length - 2));
        }

        //3
        public static void PrintDigit(int n)
        {
            PrintDigitHelper(n);
            Console.WriteLine();
        }

        public static void PrintDigitHelper(int n)
        {
            if (n >= 10)
            {
                PrintDigitHelper(n / 10);
                Console.Write($"{n % 10} ");
            }
            if (n < 10)
            {
                Console.Write($"{n} ");
            }
        }

        //4
        public static int Max(params int[] ar)
        {
            if (ar == null)
            {
                return int.MinValue;
            }

            if (ar.Length == 1)
            {
                return ar[0];
            }

            if (ar[0] > ar[1])
            {
                ar[1] = ar[0];
                VoroninProgramms.ArrDelIndProcedure(ref ar, 0);
            }
            else
            {
                VoroninProgramms.ArrDelIndProcedure(ref ar, 0);
            }
            return Max(ar);
        }

        //B1
        public static LinkedListNode<double> FindMax(LinkedListNode<double> lst, LinkedListNode<double> max)
        {
            if (lst.Next == null)
            {
                return max;
            }

            if (max.Value < lst.Next.Value)
            {
                max = lst.Next;
            }
            return FindMax(lst.Next, max);
        }


        public static LinkedListNode<double> Max(LinkedListNode<double> lst)
        {
            var max = lst;
            return FindMax(lst, max);
        }

        //b2
        public static LinkedListNode<T> FindPred<T>(LinkedListNode<T> list, Func<T, bool> pred)
        {
            if (list.Next == null)
            {
                return null;
            }

            if (pred(list.Value))
            {
                return list;
            }
            else
            {
                return FindPred(list.Next, pred);
            }
        }

        //b3
        public static int CountPredElems<T>(LinkedListNode<T> lst, Func<T, bool> pred)
        {
            if (lst == null)
                return 0;

            int cnt = 0;
            if (pred(lst.Value))
            {
                cnt++;
            }

            return cnt + CountPredElems(lst.Next, pred);
        }

        //b4
        public static bool StartsWith(LinkedListNode<int> lst1, LinkedListNode<int> lst2)
        {
            if (lst2 == null)
            {
                return true;
            }

            bool res = true;
            if (lst2.Next != null)
            {
                if (lst1.Value != lst2.Value)
                {
                    res = false;
                }
            }

            return res && StartsWith(lst1.Next, lst2.Next);
        }


        /// <summary>
        /// Узел бинарного дерева
        /// </summary>
        public class TreeNode<T>
        {
            /// <summary>
            /// Поле данных
            /// </summary>
            public T Data;

            /// <summary>
            /// Левое поддерево
            /// </summary>
            public TreeNode<T> Left;

            /// <summary>
            /// Правое поддерево
            /// </summary>
            public TreeNode<T> Right;

            /// <summary>
            /// Инициализирует узел бинарного дерева значением data поля данных
            /// и поддеревьями left, right
            /// </summary>
            /// <param name="data">Значение поля данных узла</param>
            /// <param name="left">Левое поддерево</param>
            /// <param name="right">Правое поддерево</param>
            public TreeNode(T data, TreeNode<T> left = null, TreeNode<T> right = null)
            {
                this.Data = data; // this можно убрать =)
                this.Left = left;
                this.Right = right;
            }

        }

        public static TreeNode<int> CreateTree(params int[] arr)
        {
            return BuildBinaryTreeHelp(arr, 0, arr.Length-1);
        }


        public static TreeNode<int> BuildBinaryTreeHelp(int[] arr, int start, int end)
        {
            if (start > end)
            {
                return null;
            }

            int mid = (start + end) / 2;
            TreeNode<int> root = new TreeNode<int>(arr[mid]);

            root.Left = BuildBinaryTreeHelp(arr, start, mid - 1);
            root.Right = BuildBinaryTreeHelp(arr, mid + 1, end);

            return root;
        }


        /// <summary>
        /// Нижняя граница случайного диапазона по умолчанию
        /// </summary>
        const int LOW_INT_BOUND = -20;
        /// <summary>
        /// Верхняя граница случайного диапазона по умолчанию
        /// </summary>
        const int UPPER_INT_BOUND = 20;

        /// <summary>
        /// Умный конструктор для узла бинарного дерева
        /// </summary>
        /// <param name="data">Значение поля данных узла</param>
        /// <param name="left">Левое поддерево</param>
        /// <param name="right">Правое поддерево</param>
        public static TreeNode<T> MkTNode<T>(
                    T data,
                    TreeNode<T> left = null,
                    TreeNode<T> right = null) => new TreeNode<T>(data, left, right);


        /// Строит дерево по примеру
        ///      1
        ///    /   \
        ///   2     3
        ///         /\
        ///        4  5
        static TreeNode<int> MakeExampleTree()
        {
            return null;
        }

        /// Выводит элементы дерева в инфиксном порядке и переходит на новую строку
        static void InfixHelp<T>(TreeNode<T> root, Action<T> act)
        {
            if (root == null)
                return;
            InfixHelp(root.Left, act);
            act(root.Data);
            InfixHelp(root.Right, act);
        }

        public static void InfixLn<T>(TreeNode<T> root, Action<T> act)
        {
            if (root == null)
            {
                Console.WriteLine("<empty tree>");
                return;
            }

            InfixHelp(root, act);
            Console.WriteLine();
        }

        /// Выводит элементы дерева в инфиксном 
        public static void Infix<T>(TreeNode<T> root, Action<T> act)
        {
            if (root == null)
                return;
            Infix(root.Left, act);
            act(root.Data);
            Infix(root.Right, act);
        }

        static void PrefixHelp<T>(TreeNode<T> root, Action<T> act)
        {
            if (root == null) return;
            act(root.Data);
            PrefixHelp(root.Left, act);
            PrefixHelp(root.Right, act);
        }

        /// <summary>
        /// Выводит бинарное дерево с переходом на новую строку
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="root"></param>
        /// <param name="act"></param>
        public static void PrefixLn<T>(TreeNode<T> root, Action<T> act)
        {
            PrefixHelp(root, act);
            Console.WriteLine();
        }

        /// Выводит элементы дерева в префиксном порядке 
        public static void Prefix<T>(TreeNode<T> root, Action<T> act)
        {
            if (root == null) return;
            act(root.Data);
            PrefixHelp(root.Left, act);
            PrefixHelp(root.Right, act);
        }


        public static void PostfixHelp<T>(TreeNode<T> r, Action<T> act)
        {
            if (r == null) return;
            PostfixHelp(r.Left, act);
            PostfixHelp(r.Right, act);
            act(r.Data);
        }

        public static void PostfixPrint<T>(TreeNode<T> r)
        {
            if (r == null) return;
            PostfixPrint(r.Left);
            PostfixPrint(r.Right);
            Console.Write($"{r.Data} ");
        }

        public static void PostfixPrintln<T>(TreeNode<T> r)
        {
            PostfixPrint(r);
            Console.WriteLine();
        }

        public static void Postfix<T>(TreeNode<T> r, Action<T> act)
        {
            PostfixHelp(r, act);
            Console.WriteLine();
        }



        /// Возвращает сумму элементов дерева
        public static int SumTree(TreeNode<int> root)
        {
            if (root == null)
                return 0;
            return root.Data + SumTree(root.Left) + SumTree(root.Right); ;
        }

        /// Создаёт случайное бинарное дерево целых чисел из n (n ≥ 0) элементов в 
        /// диапазоне [a, b] (a <= b)
        static Random rnd = new Random();

        public static TreeNode<int> CreateRandomTree(int n, int a = LOW_INT_BOUND, int b = UPPER_INT_BOUND)
        {
            if (n == 0) return null;
            var NLeft = rnd.Next(0, n - 1);
            return new TreeNode<int>(rnd.Next(a, b), CreateRandomTree(NLeft, a, b), CreateRandomTree(n - NLeft - 1, a, b));
        }

        /// Удваивает все элементы дерева целых чисел
        static void DoubleTreeElems(TreeNode<int> root)
        {
            if (root == null) return;
            root.Data *= 2;
            DoubleTreeElems(root.Left);
            DoubleTreeElems(root.Right);
        }

        public static bool IsLeaf<T>(TreeNode<T> root)
        {
            if(root == null) return false;

            if(root.Left == null && root.Right == null)
            {
                return true;
            } 
            else return false;
        }

        public static bool IsTop<T>(TreeNode<T> root)
        {
            if(root == null) return false;
            if(root.Left!= null || root.Right != null)
            {
                return true;
            }
            else return false;
        }


        




    }




}
