#include <iostream>
#include <glog/logging.h>
#include <google/protobuf/message_lite.h>

#include "util/calc.hpp"
#include "src/mod.hpp"
#include "src/player.hpp"

#include "pb_test.pb.h"


int main(int argc, char *argv[])
{
  GOOGLE_PROTOBUF_VERIFY_VERSION;

  google::InitGoogleLogging(argv[0]);
  google::SetLogDestination(google::INFO, "./log/");

  pb_test::AddressBook address_book;

  pb_test::Person  pa;

  pa.set_name("zhao si");

  std::cout << pa.name() << std::endl;


  LOG(INFO) << hello_world();

  LOG(WARNING) << "Hello GLOG";

  double a = 49.0;
  double b = cal_sqrt(a);
  std::cout << "a * a = " << b << std::endl;

  Player p_xiao = Player("xiaowang", 21);

  std::cout << "Player Name is " << p_xiao.get_name() << "; age " << p_xiao.get_age() << std::endl;

  return 0;
}
