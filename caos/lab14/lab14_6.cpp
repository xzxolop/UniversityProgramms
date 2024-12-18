#include <iostream>
#include <queue>
#include <thread>
#include <chrono>
#include <ctime>
#include <mutex>

std::mutex mtx;

struct Task {
    int descriptor;
    int executionTime;

    Task(int id, int seconds): descriptor(id), executionTime(seconds) {};
    void print() const {
        std::cout << descriptor << ": " << executionTime << std::endl;
    }
};

struct taskComparator
{
    bool operator()(const Task& task1, const Task& task2) {
        return task1.executionTime > task2.executionTime;
    }
};

void print(std::priority_queue<Task, std::vector<Task>, taskComparator> taskQueue) {
    for(int i = 0; i < taskQueue.size(); i++) {
        taskQueue.top().print();
        taskQueue.pop();
    }
}

void processScheduler(std::priority_queue<Task, std::vector<Task>, taskComparator>& taskQueue) {
    while (true) {
        mtx.lock();
        int size = taskQueue.size();
        mtx.unlock();
        if (size) {
            mtx.lock();
            print(taskQueue);
            Task task = taskQueue.top();
            taskQueue.pop();
            mtx.unlock();

            for(int i = 0; i < task.executionTime; i++) {
                std::this_thread::sleep_for(std::chrono::seconds(1));
            }
            mtx.lock();
            std::cout << "task #" << task.descriptor << " complete" << std::endl;
            mtx.unlock();
        }
    }
}


int main(int argc, char* argv[])
{
    srand(time(0));
    int T = 1;
    std::priority_queue<Task, std::vector<Task>, taskComparator> taskQueue;

    std::thread shedulerThread(processScheduler, std::ref(taskQueue));

    for(int i = 0; i < 50; i++) {
        Task task{i, rand() % 5};
        mtx.lock();
        std::cout << "create task: " << task.descriptor << " " << task.executionTime << std::endl;
        taskQueue.push(task);
        mtx.unlock();

        std::this_thread::sleep_for(std::chrono::seconds(T));
    }

    shedulerThread.join();

    return 0;
}
