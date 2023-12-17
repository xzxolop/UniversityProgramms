uses graphWPF;
uses Timers;

var (x1,y1):=(250.0,250.0); // center часов
var (xh,yh):=(100,100); // Длина часовой стрелки
var (xm,ym):=(140,140); // Длина минутной стрелки
var (xs,ys):=(170,170); // Длина секундной стрелки
var (xT,yT):=(180,180); // Расположение точек на цифирблате
var (h,m,s):=(6,4,2);


//Положения часовой стрелки

//0
procedure h_0;
begin
  pen.Width:=h;
  Line(x1,y1,x1,y1-yh);
end;

//1
procedure h_1 ;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(84*3.1415926/180)),y1-yh*(sin(84*3.1415926/180)));
end;

//2
procedure h_2 ;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(78*3.1415926/180)),y1-yh*(sin(78*3.1415926/180)));
end;

//3
procedure h_3 ;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(72*3.1415926/180)),y1-yh*(sin(72*3.1415926/180)));
end;

//4
procedure h_4 ;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(66*3.1415926/180)),y1-yh*(sin(66*3.1415926/180)));
end;

//5
procedure h_5 ;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(60*3.1415926/180)),y1-yh*(sin(60*3.1415926/180)));
end;

//6
procedure h_6 ;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(54*3.1415926/180)),y1-yh*(sin(54*3.1415926/180)));
end;

//7
procedure h_7 ;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(48*3.1415926/180)),y1-yh*(sin(48*3.1415926/180)));
end;

//8
procedure h_8 ;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(42*3.1415926/180)),y1-yh*(sin(42*3.1415926/180)));
end;

//9
procedure h_9;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(36*3.1415926/180)),y1-yh*(sin(36*3.1415926/180)));
end;

//10
procedure h_10;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(30*3.1415926/180)),y1-yh*(sin(30*3.1415926/180)));
end;

//11
procedure h_11;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(24*3.1415926/180)),y1-yh*(sin(24*3.1415926/180)));
end;

//12
procedure h_12;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(18*3.1415926/180)),y1-yh*(sin(18*3.1415926/180)));
end;

//13
procedure h_13;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(12*3.1415926/180)),y1-yh*(sin(12*3.1415926/180)));
end;

//14
procedure h_14;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(6*3.1415926/180)),y1-yh*(sin(6*3.1415926/180)));
end;

//15
procedure h_15;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(0*3.1415926/180)),y1-yh*(sin(0*3.1415926/180)));
end;

//16
procedure h_16;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-6*3.1415926/180)),y1-yh*(sin(-6*3.1415926/180)));
end;

//17
procedure h_17;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-12*3.1415926/180)),y1-yh*(sin(-12*3.1415926/180)));
end;

//18
procedure h_18;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-18*3.1415926/180)),y1-yh*(sin(-18*3.1415926/180)));
end;

//19
procedure h_19;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-24*3.1415926/180)),y1-yh*(sin(-24*3.1415926/180)));
end;

//20
procedure h_20;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-30*3.1415926/180)),y1-yh*(sin(-30*3.1415926/180)));
end;

//21
procedure h_21;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-36*3.1415926/180)),y1-yh*(sin(-36*3.1415926/180)));
end;

//22
procedure h_22;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-42*3.1415926/180)),y1-yh*(sin(-42*3.1415926/180)));
end;

//23
procedure h_23;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-48*3.1415926/180)),y1-yh*(sin(-48*3.1415926/180)));
end;

//24
procedure h_24;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-54*3.1415926/180)),y1-yh*(sin(-54*3.1415926/180)));
end;

//25
procedure h_25;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-60*3.1415926/180)),y1-yh*(sin(-60*3.1415926/180)));
end;

//26
procedure h_26;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-66*3.1415926/180)),y1-yh*(sin(-66*3.1415926/180)));
end;

//27
procedure h_27;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-72*3.1415926/180)),y1-yh*(sin(-72*3.1415926/180)));
end;

//28
procedure h_28;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-78*3.1415926/180)),y1-yh*(sin(-78*3.1415926/180)));
end;

//29
procedure h_29;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-84*3.1415926/180)),y1-yh*(sin(-84*3.1415926/180)));
end;

//30
procedure h_30;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-90*3.1415926/180)),y1-yh*(sin(-90*3.1415926/180)));
end;

//31
procedure h_31;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-96*3.1415926/180)),y1-yh*(sin(-96*3.1415926/180)));
end;

//32
procedure h_32;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-102*3.1415926/180)),y1-yh*(sin(-102*3.1415926/180)));
end;

//33
procedure h_33;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-108*3.1415926/180)),y1-yh*(sin(-108*3.1415926/180)));
end;

//34
procedure h_34;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-114*3.1415926/180)),y1-yh*(sin(-114*3.1415926/180)));
end;

//35
procedure h_35;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-120*3.1415926/180)),y1-yh*(sin(-120*3.1415926/180)));
end;

//36
procedure h_36;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-126*3.1415926/180)),y1-yh*(sin(-126*3.1415926/180)));
end;

//37
procedure h_37;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-132*3.1415926/180)),y1-yh*(sin(-132*3.1415926/180)));
end;

//38
procedure h_38;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-138*3.1415926/180)),y1-yh*(sin(-138*3.1415926/180)));
end;

//39
procedure h_39;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-144*3.1415926/180)),y1-yh*(sin(-144*3.1415926/180)));
end;

//40
procedure h_40;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-150*3.1415926/180)),y1-yh*(sin(-150*3.1415926/180)));
end;

//41
procedure h_41;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-156*3.1415926/180)),y1-yh*(sin(-156*3.1415926/180)));
end;

//42
procedure h_42;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-162*3.1415926/180)),y1-yh*(sin(-162*3.1415926/180)));
end;

//43
procedure h_43;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-168*3.1415926/180)),y1-yh*(sin(-168*3.1415926/180)));
end;

//44
procedure h_44;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-174*3.1415926/180)),y1-yh*(sin(-174*3.1415926/180)));
end;

//45
procedure h_45;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-180*3.1415926/180)),y1-yh*(sin(-180*3.1415926/180)));
end;

//46
procedure h_46;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-186*3.1415926/180)),y1-yh*(sin(-186*3.1415926/180)));
end;

//47
procedure h_47;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-192*3.1415926/180)),y1-yh*(sin(-192*3.1415926/180)));
end;

//48
procedure h_48;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-198*3.1415926/180)),y1-yh*(sin(-198*3.1415926/180)));
end;

//49
procedure h_49;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-204*3.1415926/180)),y1-yh*(sin(-204*3.1415926/180)));
end;

//50
procedure h_50;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-210*3.1415926/180)),y1-yh*(sin(-210*3.1415926/180)));
end;

//51
procedure h_51;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-216*3.1415926/180)),y1-yh*(sin(-216*3.1415926/180)));
end;


//52
procedure h_52;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-222*3.1415926/180)),y1-yh*(sin(-222*3.1415926/180)));
end;

//53
procedure h_53;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-228*3.1415926/180)),y1-yh*(sin(-228*3.1415926/180)));
end;

//54
procedure h_54;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-234*3.1415926/180)),y1-yh*(sin(-234*3.1415926/180)));
end;

//55
procedure h_55;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-240*3.1415926/180)),y1-yh*(sin(-240*3.1415926/180)));
end;

//56
procedure h_56;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-246*3.1415926/180)),y1-yh*(sin(-246*3.1415926/180)));
end;

//57
procedure h_57;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-252*3.1415926/180)),y1-yh*(sin(-252*3.1415926/180)));
end;

//58
procedure h_58;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-258*3.1415926/180)),y1-yh*(sin(-258*3.1415926/180)));
end;

//59
procedure h_59;
begin
  pen.Width:=h;
  Line(x1,y1,x1+xh*(cos(-264*3.1415926/180)),y1-yh*(sin(-264*3.1415926/180)));
end;



//Положения минутной стрелки

//0
procedure m_0;
begin
  pen.Width:=m;
  Line(x1,y1,x1,y1-ym);
end;

//1
procedure m_1 ;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(84*3.1415926/180)),y1-ym*(sin(84*3.1415926/180)));
end;

//2
procedure m_2 ;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(78*3.1415926/180)),y1-ym*(sin(78*3.1415926/180)));
end;

//3
procedure m_3 ;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(72*3.1415926/180)),y1-ym*(sin(72*3.1415926/180)));
end;

//4
procedure m_4 ;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(66*3.1415926/180)),y1-ym*(sin(66*3.1415926/180)));
end;

//5
procedure m_5 ;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(60*3.1415926/180)),y1-ym*(sin(60*3.1415926/180)));
end;

//6
procedure m_6 ;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(54*3.1415926/180)),y1-ym*(sin(54*3.1415926/180)));
end;

//7
procedure m_7 ;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(48*3.1415926/180)),y1-ym*(sin(48*3.1415926/180)));
end;

//8
procedure m_8 ;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(42*3.1415926/180)),y1-ym*(sin(42*3.1415926/180)));
end;

//9
procedure m_9;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(36*3.1415926/180)),y1-ym*(sin(36*3.1415926/180)));
end;

//10
procedure m_10;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(30*3.1415926/180)),y1-ym*(sin(30*3.1415926/180)));
end;

//11
procedure m_11;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(24*3.1415926/180)),y1-ym*(sin(24*3.1415926/180)));
end;

//12
procedure m_12;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(18*3.1415926/180)),y1-ym*(sin(18*3.1415926/180)));
end;

//13
procedure m_13;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(12*3.1415926/180)),y1-ym*(sin(12*3.1415926/180)));
end;

//14
procedure m_14;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(6*3.1415926/180)),y1-ym*(sin(6*3.1415926/180)));
end;

//15
procedure m_15;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(0*3.1415926/180)),y1-ym*(sin(0*3.1415926/180)));
end;

//16
procedure m_16;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-6*3.1415926/180)),y1-ym*(sin(-6*3.1415926/180)));
end;

//17
procedure m_17;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-12*3.1415926/180)),y1-ym*(sin(-12*3.1415926/180)));
end;

//18
procedure m_18;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-18*3.1415926/180)),y1-ym*(sin(-18*3.1415926/180)));
end;

//19
procedure m_19;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-24*3.1415926/180)),y1-ym*(sin(-24*3.1415926/180)));
end;

//20
procedure m_20;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-30*3.1415926/180)),y1-ym*(sin(-30*3.1415926/180)));
end;

//21
procedure m_21;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-36*3.1415926/180)),y1-ym*(sin(-36*3.1415926/180)));
end;

//22
procedure m_22;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-42*3.1415926/180)),y1-ym*(sin(-42*3.1415926/180)));
end;

//23
procedure m_23;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-48*3.1415926/180)),y1-ym*(sin(-48*3.1415926/180)));
end;

//24
procedure m_24;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-54*3.1415926/180)),y1-ym*(sin(-54*3.1415926/180)));
end;

//25
procedure m_25;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-60*3.1415926/180)),y1-ym*(sin(-60*3.1415926/180)));
end;

//26
procedure m_26;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-66*3.1415926/180)),y1-ym*(sin(-66*3.1415926/180)));
end;

//27
procedure m_27;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-72*3.1415926/180)),y1-ym*(sin(-72*3.1415926/180)));
end;

//28
procedure m_28;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-78*3.1415926/180)),y1-ym*(sin(-78*3.1415926/180)));
end;

//29
procedure m_29;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-84*3.1415926/180)),y1-ym*(sin(-84*3.1415926/180)));
end;

//30
procedure m_30;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-90*3.1415926/180)),y1-ym*(sin(-90*3.1415926/180)));
end;

//31
procedure m_31;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-96*3.1415926/180)),y1-ym*(sin(-96*3.1415926/180)));
end;

//32
procedure m_32;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-102*3.1415926/180)),y1-ym*(sin(-102*3.1415926/180)));
end;

//33
procedure m_33;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-108*3.1415926/180)),y1-ym*(sin(-108*3.1415926/180)));
end;

//34
procedure m_34;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-114*3.1415926/180)),y1-ym*(sin(-114*3.1415926/180)));
end;

//35
procedure m_35;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-120*3.1415926/180)),y1-ym*(sin(-120*3.1415926/180)));
end;

//36
procedure m_36;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-126*3.1415926/180)),y1-ym*(sin(-126*3.1415926/180)));
end;

//37
procedure m_37;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-132*3.1415926/180)),y1-ym*(sin(-132*3.1415926/180)));
end;

//38
procedure m_38;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-138*3.1415926/180)),y1-ym*(sin(-138*3.1415926/180)));
end;

//39
procedure m_39;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-144*3.1415926/180)),y1-ym*(sin(-144*3.1415926/180)));
end;

//40
procedure m_40;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-150*3.1415926/180)),y1-ym*(sin(-150*3.1415926/180)));
end;

//41
procedure m_41;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-156*3.1415926/180)),y1-ym*(sin(-156*3.1415926/180)));
end;

//42
procedure m_42;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-162*3.1415926/180)),y1-ym*(sin(-162*3.1415926/180)));
end;

//43
procedure m_43;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-168*3.1415926/180)),y1-ym*(sin(-168*3.1415926/180)));
end;

//44
procedure m_44;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-174*3.1415926/180)),y1-ym*(sin(-174*3.1415926/180)));
end;

//45
procedure m_45;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-180*3.1415926/180)),y1-ym*(sin(-180*3.1415926/180)));
end;

//46
procedure m_46;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-186*3.1415926/180)),y1-ym*(sin(-186*3.1415926/180)));
end;

//47
procedure m_47;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-192*3.1415926/180)),y1-ym*(sin(-192*3.1415926/180)));
end;

//48
procedure m_48;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-198*3.1415926/180)),y1-ym*(sin(-198*3.1415926/180)));
end;

//49
procedure m_49;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-204*3.1415926/180)),y1-ym*(sin(-204*3.1415926/180)));
end;

//50
procedure m_50;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-210*3.1415926/180)),y1-ym*(sin(-210*3.1415926/180)));
end;

//51
procedure m_51;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-216*3.1415926/180)),y1-ym*(sin(-216*3.1415926/180)));
end;


//52
procedure m_52;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-222*3.1415926/180)),y1-ym*(sin(-222*3.1415926/180)));
end;

//53
procedure m_53;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-228*3.1415926/180)),y1-ym*(sin(-228*3.1415926/180)));
end;

//54
procedure m_54;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-234*3.1415926/180)),y1-ym*(sin(-234*3.1415926/180)));
end;

//55
procedure m_55;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-240*3.1415926/180)),y1-ym*(sin(-240*3.1415926/180)));
end;

//56
procedure m_56;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-246*3.1415926/180)),y1-ym*(sin(-246*3.1415926/180)));
end;

//57
procedure m_57;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-252*3.1415926/180)),y1-ym*(sin(-252*3.1415926/180)));
end;

//58
procedure m_58;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-258*3.1415926/180)),y1-ym*(sin(-258*3.1415926/180)));
end;

//59
procedure m_59;
begin
  pen.Width:=m;
  Line(x1,y1,x1+xm*(cos(-264*3.1415926/180)),y1-ym*(sin(-264*3.1415926/180)));
end;






//ПОЛОЖЕНИЯ СЕКУНДНОЙ СТРЕЛКИ

//0
procedure s_0;
begin
  pen.Width:=s;
  Line(x1,y1,x1,y1-ys);
end;

//1
procedure s_1 ;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(84*3.1415926/180)),y1-ys*(sin(84*3.1415926/180)));
end;

//2
procedure s_2 ;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(78*3.1415926/180)),y1-ys*(sin(78*3.1415926/180)));
end;

//3
procedure s_3 ;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(72*3.1415926/180)),y1-ys*(sin(72*3.1415926/180)));
end;

//4
procedure s_4 ;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(66*3.1415926/180)),y1-ys*(sin(66*3.1415926/180)));
end;

//5
procedure s_5 ;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(60*3.1415926/180)),y1-ys*(sin(60*3.1415926/180)));
end;

//6
procedure s_6 ;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(54*3.1415926/180)),y1-ys*(sin(54*3.1415926/180)));
end;

//7
procedure s_7 ;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(48*3.1415926/180)),y1-ys*(sin(48*3.1415926/180)));
end;

//8
procedure s_8 ;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(42*3.1415926/180)),y1-ys*(sin(42*3.1415926/180)));
end;

//9
procedure s_9;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(36*3.1415926/180)),y1-ys*(sin(36*3.1415926/180)));
end;

//10
procedure s_10;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(30*3.1415926/180)),y1-ys*(sin(30*3.1415926/180)));
end;

//11
procedure s_11;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(24*3.1415926/180)),y1-ys*(sin(24*3.1415926/180)));
end;

//12
procedure s_12;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(18*3.1415926/180)),y1-ys*(sin(18*3.1415926/180)));
end;

//13
procedure s_13;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(12*3.1415926/180)),y1-ys*(sin(12*3.1415926/180)));
end;

//14
procedure s_14;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(6*3.1415926/180)),y1-ys*(sin(6*3.1415926/180)));
end;

//15
procedure s_15;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(0*3.1415926/180)),y1-ys*(sin(0*3.1415926/180)));
end;

//16
procedure s_16;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-6*3.1415926/180)),y1-ys*(sin(-6*3.1415926/180)));
end;

//17
procedure s_17;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-12*3.1415926/180)),y1-ys*(sin(-12*3.1415926/180)));
end;

//18
procedure s_18;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-18*3.1415926/180)),y1-ys*(sin(-18*3.1415926/180)));
end;

//19
procedure s_19;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-24*3.1415926/180)),y1-ys*(sin(-24*3.1415926/180)));
end;

//20
procedure s_20;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-30*3.1415926/180)),y1-ys*(sin(-30*3.1415926/180)));
end;

//21
procedure s_21;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-36*3.1415926/180)),y1-ys*(sin(-36*3.1415926/180)));
end;

//22
procedure s_22;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-42*3.1415926/180)),y1-ys*(sin(-42*3.1415926/180)));
end;

//23
procedure s_23;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-48*3.1415926/180)),y1-ys*(sin(-48*3.1415926/180)));
end;

//24
procedure s_24;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-54*3.1415926/180)),y1-ys*(sin(-54*3.1415926/180)));
end;

//25
procedure s_25;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-60*3.1415926/180)),y1-ys*(sin(-60*3.1415926/180)));
end;

//26
procedure s_26;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-66*3.1415926/180)),y1-ys*(sin(-66*3.1415926/180)));
end;

//27
procedure s_27;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-72*3.1415926/180)),y1-ys*(sin(-72*3.1415926/180)));
end;

//28
procedure s_28;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-78*3.1415926/180)),y1-ys*(sin(-78*3.1415926/180)));
end;

//29
procedure s_29;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-84*3.1415926/180)),y1-ys*(sin(-84*3.1415926/180)));
end;

//30
procedure s_30;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-90*3.1415926/180)),y1-ys*(sin(-90*3.1415926/180)));
end;

//31
procedure s_31;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-96*3.1415926/180)),y1-ys*(sin(-96*3.1415926/180)));
end;

//32
procedure s_32;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-102*3.1415926/180)),y1-ys*(sin(-102*3.1415926/180)));
end;

//33
procedure s_33;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-108*3.1415926/180)),y1-ys*(sin(-108*3.1415926/180)));
end;

//34
procedure s_34;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-114*3.1415926/180)),y1-ys*(sin(-114*3.1415926/180)));
end;

//35
procedure s_35;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-120*3.1415926/180)),y1-ys*(sin(-120*3.1415926/180)));
end;

//36
procedure s_36;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-126*3.1415926/180)),y1-ys*(sin(-126*3.1415926/180)));
end;

//37
procedure s_37;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-132*3.1415926/180)),y1-ys*(sin(-132*3.1415926/180)));
end;

//38
procedure s_38;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-138*3.1415926/180)),y1-ys*(sin(-138*3.1415926/180)));
end;

//39
procedure s_39;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-144*3.1415926/180)),y1-ys*(sin(-144*3.1415926/180)));
end;

//40
procedure s_40;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-150*3.1415926/180)),y1-ys*(sin(-150*3.1415926/180)));
end;

//41
procedure s_41;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-156*3.1415926/180)),y1-ys*(sin(-156*3.1415926/180)));
end;

//42
procedure s_42;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-162*3.1415926/180)),y1-ys*(sin(-162*3.1415926/180)));
end;

//43
procedure s_43;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-168*3.1415926/180)),y1-ys*(sin(-168*3.1415926/180)));
end;

//44
procedure s_44;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-174*3.1415926/180)),y1-ys*(sin(-174*3.1415926/180)));
end;

//45
procedure s_45;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-180*3.1415926/180)),y1-ys*(sin(-180*3.1415926/180)));
end;

//46
procedure s_46;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-186*3.1415926/180)),y1-ys*(sin(-186*3.1415926/180)));
end;

//47
procedure s_47;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-192*3.1415926/180)),y1-ys*(sin(-192*3.1415926/180)));
end;

//48
procedure s_48;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-198*3.1415926/180)),y1-ys*(sin(-198*3.1415926/180)));
end;

//49
procedure s_49;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-204*3.1415926/180)),y1-ys*(sin(-204*3.1415926/180)));
end;

//50
procedure s_50;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-210*3.1415926/180)),y1-ys*(sin(-210*3.1415926/180)));
end;

//51
procedure s_51;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-216*3.1415926/180)),y1-ys*(sin(-216*3.1415926/180)));
end;


//52
procedure s_52;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-222*3.1415926/180)),y1-ys*(sin(-222*3.1415926/180)));
end;

//53
procedure s_53;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-228*3.1415926/180)),y1-ys*(sin(-228*3.1415926/180)));
end;

//54
procedure s_54;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-234*3.1415926/180)),y1-ys*(sin(-234*3.1415926/180)));
end;

//55
procedure s_55;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-240*3.1415926/180)),y1-ys*(sin(-240*3.1415926/180)));
end;

//56
procedure s_56;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-246*3.1415926/180)),y1-ys*(sin(-246*3.1415926/180)));
end;

//57
procedure s_57;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-252*3.1415926/180)),y1-ys*(sin(-252*3.1415926/180)));
end;

//58
procedure s_58;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-258*3.1415926/180)),y1-ys*(sin(-258*3.1415926/180)));
end;

//59
procedure s_59;
begin
  pen.Width:=s;
  Line(x1,y1,x1+xs*(cos(-264*3.1415926/180)),y1-ys*(sin(-264*3.1415926/180)));
end;



procedure clock;
begin
  var currTime := System.DateTime.Now;
  var hour := currTime.Hour;
  var min := currTime.Minute;
  var sec := currTime.Second;
  Circle(x1,y1, 200); // часы
  pen.Width:=1;
  
  // Точки на циферблате
  for var i:=-270 to 90 do begin
    if (i mod 6) = 0 then
      Circle(x1+xT*(cos(i*3.1415926/180)),y1+yT*(sin(i*3.1415926/180)),3,Colors.Black);
    //Часовые
    if (i mod 30) = 0 then
      Circle(x1+xT*(cos(i*3.1415926/180)),y1+yT*(sin(i*3.1415926/180)),4,Colors.Red);
  end;
  
  
  if (hour = 0) or (hour = 12) then begin
    case min of
      0:h_0;
      1:h_0;
      2:h_0;
      3:h_0;
      4:h_0;
      5:h_0;
      6:h_0;
      7:h_0;
      8:h_0;
      9:h_0;
      10:h_0;
      11:h_0; 
    end;
    
    case min of
      12:h_1;
      13:h_1;
      14:h_1;
      15:h_1;
      16:h_1;
      17:h_1;
      18:h_1;
      19:h_1;
      20:h_1;
      21:h_1;
      22:h_1;
      23:h_1; 
    end;
    
    case min of
      24:h_2;
      25:h_2;
      26:h_2;
      27:h_2;
      28:h_2;
      29:h_2;
      30:h_2;
      31:h_2;
      32:h_2;
      33:h_2;
      34:h_2;
      35:h_2; 
    end;
    
    case min of
      36:h_3;
      37:h_3;
      38:h_3;
      39:h_3;
      40:h_3;
      41:h_3;
      42:h_3;
      43:h_3;
      44:h_3;
      45:h_3;
      46:h_3;
      47:h_3;
    end;
    
    case min of
      48:h_4;
      49:h_4;
      50:h_4;
      51:h_4;
      52:h_4;
      53:h_4;
      54:h_4;
      55:h_4;
      56:h_4;
      57:h_4;
      58:h_4;
      59:h_4;
    end;
  end;

 
  if (hour = 1) or (hour = 13) then begin
    case min of
      0:h_5;
      1:h_5;
      2:h_5;
      3:h_5;
      4:h_5;
      5:h_5;
      6:h_5;
      7:h_5;
      8:h_5;
      9:h_5;
      10:h_5;
      11:h_5; 
    end;
    
    case min of
      12:h_6;
      13:h_6;
      14:h_6;
      15:h_6;
      16:h_6;
      17:h_6;
      18:h_6;
      19:h_6;
      20:h_6;
      21:h_6;
      22:h_6;
      23:h_6; 
    end;
    
    case min of
      24:h_7;
      25:h_7;
      26:h_7;
      27:h_7;
      28:h_7;
      29:h_7;
      30:h_7;
      31:h_7;
      32:h_7;
      33:h_7;
      34:h_7;
      35:h_7; 
    end;
    
    case min of
      36:h_8;
      37:h_8;
      38:h_8;
      39:h_8;
      40:h_8;
      41:h_8;
      42:h_8;
      43:h_8;
      44:h_8;
      45:h_8;
      46:h_8;
      47:h_8;
    end;
    
    case min of
      48:h_9;
      49:h_9;
      50:h_9;
      51:h_9;
      52:h_9;
      53:h_9;
      54:h_9;
      55:h_9;
      56:h_9;
      57:h_9;
      58:h_9;
      59:h_9;
    end;
  end;
  
  if (hour = 2) or (hour = 14) then begin
    case min of
      0:h_10;
      1:h_10;
      2:h_10;
      3:h_10;
      4:h_10;
      5:h_10;
      6:h_10;
      7:h_10;
      8:h_10;
      9:h_10;
      10:h_10;
      11:h_10; 
    end;
    
    case min of
      12:h_11;
      13:h_11;
      14:h_11;
      15:h_11;
      16:h_11;
      17:h_11;
      18:h_11;
      19:h_11;
      20:h_11;
      21:h_11;
      22:h_11;
      23:h_11; 
    end;
    
    case min of
      24:h_12;
      25:h_12;
      26:h_12;
      27:h_12;
      28:h_12;
      29:h_12;
      30:h_12;
      31:h_12;
      32:h_12;
      33:h_12;
      34:h_12;
      35:h_12; 
    end;
    
    case min of
      36:h_13;
      37:h_13;
      38:h_13;
      39:h_13;
      40:h_13;
      41:h_13;
      42:h_13;
      43:h_13;
      44:h_13;
      45:h_13;
      46:h_13;
      47:h_13;
    end;
    
    case min of
      48:h_14;
      49:h_14;
      50:h_14;
      51:h_14;
      52:h_14;
      53:h_14;
      54:h_14;
      55:h_14;
      56:h_14;
      57:h_14;
      58:h_14;
      59:h_14;
    end;
  end;
  
  if (hour = 3) or (hour = 15) then begin
    case min of
      0:h_15;
      1:h_15;
      2:h_15;
      3:h_15;
      4:h_15;
      5:h_15;
      6:h_15;
      7:h_15;
      8:h_15;
      9:h_15;
      10:h_15;
      11:h_15;
    end;
    
    case min of
      12:h_16;
      13:h_16;
      14:h_16;
      15:h_16;
      16:h_16;
      17:h_16;
      18:h_16;
      19:h_16;
      20:h_16;
      21:h_16;
      22:h_16;
      23:h_16;
    end;
    
    case min of
      24:h_17;
      25:h_17;
      26:h_17;
      27:h_17;
      28:h_17;
      29:h_17;
      30:h_17;
      31:h_17;
      32:h_17;
      33:h_17;
      34:h_17;
      35:h_17;
    end;
    
    case min of
      36:h_18;
      37:h_18;
      38:h_18;
      39:h_18;
      40:h_18;
      41:h_18;
      42:h_18;
      43:h_18;
      44:h_18;
      45:h_18;
      46:h_18;
      47:h_18;
    end;
    
    case min of
      48:h_19;
      49:h_19;
      50:h_19;
      51:h_19;
      52:h_19;
      53:h_19;
      54:h_19;
      55:h_19;
      56:h_19;
      57:h_19;
      58:h_19;
      59:h_19;
    end;
  end;
  
  if (hour = 4) or (hour = 16) then begin
    case min of
      0:h_20;
      1:h_20;
      2:h_20;
      3:h_20;
      4:h_20;
      5:h_20;
      6:h_20;
      7:h_20;
      8:h_20;
      9:h_20;
      10:h_20;
      11:h_20;
    end;
    
    case min of
      12:h_21;
      13:h_21;
      14:h_21;
      15:h_21;
      16:h_21;
      17:h_21;
      18:h_21;
      19:h_21;
      20:h_21;
      21:h_21;
      22:h_21;
      23:h_21;
    end;
    
    case min of
      24:h_22;
      25:h_22;
      26:h_22;
      27:h_22;
      28:h_22;
      29:h_22;
      30:h_22;
      31:h_22;
      32:h_22;
      33:h_22;
      34:h_22;
      35:h_22;
    end;
    
    case min of
      36:h_23;
      37:h_23;
      38:h_23;
      39:h_23;
      40:h_23;
      41:h_23;
      42:h_23;
      43:h_23;
      44:h_23;
      45:h_23;
      46:h_23;
      47:h_23;
    end;
    
    case min of
      48:h_24;
      49:h_24;
      50:h_24;
      51:h_24;
      52:h_24;
      53:h_24;
      54:h_24;
      55:h_24;
      56:h_24;
      57:h_24;
      58:h_24;
      59:h_24;
    end;
  end;
  
  
  if (hour = 5) or (hour = 17) then begin
    case min of
      0:h_25;
      1:h_25;
      2:h_25;
      3:h_25;
      4:h_25;
      5:h_25;
      6:h_25;
      7:h_25;
      8:h_25;
      9:h_25;
      10:h_25;
      11:h_25;
    end;
    
    case min of
      12:h_26;
      13:h_26;
      14:h_26;
      15:h_26;
      16:h_26;
      17:h_26;
      18:h_26;
      19:h_26;
      20:h_26;
      21:h_26;
      22:h_26;
      23:h_26;
    end;
    
    case min of
      24:h_27;
      25:h_27;
      26:h_27;
      27:h_27;
      28:h_27;
      29:h_27;
      30:h_27;
      31:h_27;
      32:h_27;
      33:h_27;
      34:h_27;
      35:h_27;
    end;
    
    case min of
      36:h_28;
      37:h_28;
      38:h_28;
      39:h_28;
      40:h_28;
      41:h_28;
      42:h_28;
      43:h_28;
      44:h_28;
      45:h_28;
      46:h_28;
      47:h_28;
    end;
    
    case min of
      48:h_29;
      49:h_29;
      50:h_29;
      51:h_29;
      52:h_29;
      53:h_29;
      54:h_29;
      55:h_29;
      56:h_29;
      57:h_29;
      58:h_29;
      59:h_29;
    end;
  end;
  
  
  if (hour = 6) or (hour = 18) then begin
    case min of
      0:h_30;
      1:h_30;
      2:h_30;
      3:h_30;
      4:h_30;
      5:h_30;
      6:h_30;
      7:h_30;
      8:h_30;
      9:h_30;
      10:h_30;
      11:h_30;
    end;
    
    case min of
      12:h_31;
      13:h_31;
      14:h_31;
      15:h_31;
      16:h_31;
      17:h_31;
      18:h_31;
      19:h_31;
      20:h_31;
      21:h_31;
      22:h_31;
      23:h_31;
    end;
    
    case min of
      24:h_32;
      25:h_32;
      26:h_32;
      27:h_32;
      28:h_32;
      29:h_32;
      30:h_32;
      31:h_32;
      32:h_32;
      33:h_32;
      34:h_32;
      35:h_32;
    end;
    
    case min of
      36:h_33;
      37:h_33;
      38:h_33;
      39:h_33;
      40:h_33;
      41:h_33;
      42:h_33;
      43:h_33;
      44:h_33;
      45:h_33;
      46:h_33;
      47:h_33;
    end;
    
    case min of
      48:h_34;
      49:h_34;
      50:h_34;
      51:h_34;
      52:h_34;
      53:h_34;
      54:h_34;
      55:h_34;
      56:h_34;
      57:h_34;
      58:h_34;
      59:h_34;
    end;
  end;
  
  if (hour = 7) or (hour = 19) then begin
    case min of
      0:h_35;
      1:h_35;
      2:h_35;
      3:h_35;
      4:h_35;
      5:h_35;
      6:h_35;
      7:h_35;
      8:h_35;
      9:h_35;
      10:h_35;
      11:h_35;
    end;
    
    case min of
      12:h_36;
      13:h_36;
      14:h_36;
      15:h_36;
      16:h_36;
      17:h_36;
      18:h_36;
      19:h_36;
      20:h_36;
      21:h_36;
      22:h_36;
      23:h_36;
    end;
    
    case min of
      24:h_37;
      25:h_37;
      26:h_37;
      27:h_37;
      28:h_37;
      29:h_37;
      30:h_37;
      31:h_37;
      32:h_37;
      33:h_37;
      34:h_37;
      35:h_37;
    end;
    
    case min of
      36:h_38;
      37:h_38;
      38:h_38;
      39:h_38;
      40:h_38;
      41:h_38;
      42:h_38;
      43:h_38;
      44:h_38;
      45:h_38;
      46:h_38;
      47:h_38;
    end;
    
    case min of
      48:h_39;
      49:h_39;
      50:h_39;
      51:h_39;
      52:h_39;
      53:h_39;
      54:h_39;
      55:h_39;
      56:h_39;
      57:h_39;
      58:h_39;
      59:h_39;
    end;
  end;
  
  if (hour = 8) or (hour = 20) then begin
    case min of
      0:h_40;
      1:h_40;
      2:h_40;
      3:h_40;
      4:h_40;
      5:h_40;
      6:h_40;
      7:h_40;
      8:h_40;
      9:h_40;
      10:h_40;
      11:h_40;
    end;
    
    case min of
      12:h_41;
      13:h_41;
      14:h_41;
      15:h_41;
      16:h_41;
      17:h_41;
      18:h_41;
      19:h_41;
      20:h_41;
      21:h_41;
      22:h_41;
      23:h_41;
    end;
    
    case min of
      24:h_42;
      25:h_42;
      26:h_42;
      27:h_42;
      28:h_42;
      29:h_42;
      30:h_42;
      31:h_42;
      32:h_42;
      33:h_42;
      34:h_42;
      35:h_42;
    end;
    
    case min of
      36:h_43;
      37:h_43;
      38:h_43;
      39:h_43;
      40:h_43;
      41:h_43;
      42:h_43;
      43:h_43;
      44:h_43;
      45:h_43;
      46:h_43;
      47:h_43;
    end;
    
    case min of
      48:h_44;
      49:h_44;
      50:h_44;
      51:h_44;
      52:h_44;
      53:h_44;
      54:h_44;
      55:h_44;
      56:h_44;
      57:h_44;
      58:h_44;
      59:h_44;
    end;
  end;
  
  
  if (hour = 9) or (hour = 21) then begin
    case min of
      0:h_45;
      1:h_45;
      2:h_45;
      3:h_45;
      4:h_45;
      5:h_45;
      6:h_45;
      7:h_45;
      8:h_45;
      9:h_45;
      10:h_45;
      11:h_45;
    end;
    
    case min of
      12:h_46;
      13:h_46;
      14:h_46;
      15:h_46;
      16:h_46;
      17:h_46;
      18:h_46;
      19:h_46;
      20:h_46;
      21:h_46;
      22:h_46;
      23:h_46;
    end;
    
    case min of
      24:h_47;
      25:h_47;
      26:h_47;
      27:h_47;
      28:h_47;
      29:h_47;
      30:h_47;
      31:h_47;
      32:h_47;
      33:h_47;
      34:h_47;
      35:h_47;
    end;
    
    case min of
      36:h_48;
      37:h_48;
      38:h_48;
      39:h_48;
      40:h_48;
      41:h_48;
      42:h_48;
      43:h_48;
      44:h_48;
      45:h_48;
      46:h_48;
      47:h_48;
    end;
    
    case min of
      48:h_49;
      49:h_49;
      50:h_49;
      51:h_49;
      52:h_49;
      53:h_49;
      54:h_49;
      55:h_49;
      56:h_49;
      57:h_49;
      58:h_49;
      59:h_49;
    end;
  end;
  
  
  if (hour = 10) or (hour = 22) then begin
    case min of
      0:h_50;
      1:h_50;
      2:h_50;
      3:h_50;
      4:h_50;
      5:h_50;
      6:h_50;
      7:h_50;
      8:h_50;
      9:h_50;
      10:h_50;
      11:h_50;
    end;
    
    case min of
      12:h_51;
      13:h_51;
      14:h_51;
      15:h_51;
      16:h_51;
      17:h_51;
      18:h_51;
      19:h_51;
      20:h_51;
      21:h_51;
      22:h_51;
      23:h_51;
    end;
    
    case min of
      24:h_52;
      25:h_52;
      26:h_52;
      27:h_52;
      28:h_52;
      29:h_52;
      30:h_52;
      31:h_52;
      32:h_52;
      33:h_52;
      34:h_52;
      35:h_52;
    end;
    
    case min of
      36:h_53;
      37:h_53;
      38:h_53;
      39:h_53;
      40:h_53;
      41:h_53;
      42:h_53;
      43:h_53;
      44:h_53;
      45:h_53;
      46:h_53;
      47:h_53;
    end;
    
    case min of
      48:h_54;
      49:h_54;
      50:h_54;
      51:h_54;
      52:h_54;
      53:h_54;
      54:h_54;
      55:h_54;
      56:h_54;
      57:h_54;
      58:h_54;
      59:h_54;
    end;
  end;
  
  if (hour = 11) or (hour = 23) then begin
    case min of
      0:h_55;
      1:h_55;
      2:h_55;
      3:h_55;
      4:h_55;
      5:h_55;
      6:h_55;
      7:h_55;
      8:h_55;
      9:h_55;
      10:h_55;
      11:h_55;
    end;
    
    case min of
      12:h_56;
      13:h_56;
      14:h_56;
      15:h_56;
      16:h_56;
      17:h_56;
      18:h_56;
      19:h_56;
      20:h_56;
      21:h_56;
      22:h_56;
      23:h_56;
    end;
    
    case min of
      24:h_57;
      25:h_57;
      26:h_57;
      27:h_57;
      28:h_57;
      29:h_57;
      30:h_57;
      31:h_57;
      32:h_57;
      33:h_57;
      34:h_57;
      35:h_57;
    end;
    
    case min of
      36:h_58;
      37:h_58;
      38:h_58;
      39:h_58;
      40:h_58;
      41:h_58;
      42:h_58;
      43:h_58;
      44:h_58;
      45:h_58;
      46:h_58;
      47:h_58;
    end;
    
    case min of
      48:h_59;
      49:h_59;
      50:h_59;
      51:h_59;
      52:h_59;
      53:h_59;
      54:h_59;
      55:h_59;
      56:h_59;
      57:h_59;
      58:h_59;
      59:h_59;
    end;
  end;
  
   
   
   
  case min of
    1:m_1;
    2:m_2;
    3:m_3;
    4:m_4;
    5:m_5;
    6:m_6;
    7:m_7;
    8:m_8;
    9:m_9;
    10:m_10;
    11:m_11;
    12:m_12;
    13:m_13;
    14:m_14;
    15:m_15;
    16:m_16;
    17:m_17;
    18:m_18;
    19:m_19;
    20:m_20;
    21:m_21;
    22:m_22;
    23:m_23;
    24:m_24;
    25:m_25;
    26:m_26;
    27:m_27;
    28:m_28;
    29:m_29;
    30:m_30;
    31:m_31;
    32:m_32;
    33:m_33;
    34:m_34;
    35:m_35;
    36:m_36;
    37:m_37;
    38:m_38;
    39:m_39;
    40:m_40;
    41:m_41;
    42:m_42;
    43:m_43;
    44:m_44;
    45:m_45;
    46:m_46;
    47:m_47;
    48:m_48;
    49:m_49;
    50:m_50;
    51:m_51;
    52:m_52;
    53:m_53;
    54:m_54;
    55:m_55;
    56:m_56;
    57:m_57;
    58:m_58;
    59:m_59;
    60:m_0;
    0:m_0;
   end;
    
   case sec of
    1:s_1;
    2:s_2;
    3:s_3;
    4:s_4;
    5:s_5;
    6:s_6;
    7:s_7;
    8:s_8;
    9:s_9;
    10:s_10;
    11:s_11;
    12:s_12;
    13:s_13;
    14:s_14;
    15:s_15;
    16:s_16;
    17:s_17;
    18:s_18;
    19:s_19;
    20:s_20;
    21:s_21;
    22:s_22;
    23:s_23;
    24:s_24;
    25:s_25;
    26:s_26;
    27:s_27;
    28:s_28;
    29:s_29;
    30:s_30;
    31:s_31;
    32:s_32;
    33:s_33;
    34:s_34;
    35:s_35;
    36:s_36;
    37:s_37;
    38:s_38;
    39:s_39;
    40:s_40;
    41:s_41;
    42:s_42;
    43:s_43;
    44:s_44;
    45:s_45;
    46:s_46;
    47:s_47;
    48:s_48;
    49:s_49;
    50:s_50;
    51:s_51;
    52:s_52;
    53:s_53;
    54:s_54;
    55:s_55;
    56:s_56;
    57:s_57;
    58:s_58;
    59:s_59;
    60:s_0;
    0:s_0;
  end;
end;

procedure GoClock;
begin
  clock;
end;
  
begin  
  var t:= new Timer(1000, GoClock);
  t.Start;
end.
