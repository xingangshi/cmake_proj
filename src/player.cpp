#include "player.hpp"


Player::Player(const std::string& name, int age):m_age(age), m_name(name)
    {}

int Player::get_age()
{
  return m_age;
}

std::string Player::get_name()
{
  return m_name;
}
