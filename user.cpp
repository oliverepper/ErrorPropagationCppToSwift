#include <iostream>
#include "Vector.hpp"

int main() {
    Vector v{2};
    v[0] = 1.0;
    v[1] = 2.0;

    std::cout << "Vector has size: " << v.size() << std::endl
              << "last element: " << v[v.size() - 1] << std::endl;
    
    try {
        std::cout << "v[100000]: " << v[100000] << std::endl;
    } catch (std::out_of_range& err) {
        std::cerr << "Error: " << err.what() << std::endl;
    }

    return 0;
}