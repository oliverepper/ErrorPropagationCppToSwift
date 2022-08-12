class Vector {
public:
    Vector(int s);
    ~Vector();
    double& operator[](int i);
    int size();
private:
    double *elem;
    int sz;
};