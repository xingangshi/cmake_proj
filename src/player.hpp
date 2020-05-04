#ifndef _TGTEST_HPP
#define _TGTEST_HPP

#include <string>

class Player
{
  public:
    Player(const std::string& name = "", int age = 0);

  public:
    int get_age();
    std::string get_name();

  private:
    int m_age;
    std::string m_name;
};

#endif //_TGTEST_HPP
