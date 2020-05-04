#include <gtest/gtest.h>

#include "../src/player.hpp"

#include "../src/mod.hpp"

TEST(test_tgtest, get_age)
{
    Player player("Joel", 21);
    ASSERT_TRUE(player.get_age() == 21) << "age is not 16";
}

TEST(test_tgtest, get_name)
{
    Player player("Joel", 21);
    ASSERT_EQ(player.get_name(), "Joel") << "name is not Joel";
}

TEST(test_tgtest, hello_world)
{
    ASSERT_EQ(hello_world(), "Hello world") << "hello_world() is not 'Hello world'";
}
