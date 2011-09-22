#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char **argv) {
  int sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
  struct sockaddr_in address;
  char *ip = "127.0.0.1";
  unsigned short port = 0;

  if(sock < 0) printf("Could not open socket.\n");

  memset( &address, 0, sizeof(address) );
  address.sin_family = AF_INET;
  address.sin_addr.s_addr = htonl(INADDR_ANY);
  address.sin_port = htons(port);

  int bound = bind( sock, (struct sockaddr *) &address, sizeof(address) );

  if(bound < 0) printf("Could not bind to socket.\n");

  int a_size = sizeof(struct sockaddr_in);
  struct sockaddr_in a;
  int a_found = getsockname( sock, (struct sockaddr *) &a, &a_size );

  if(a_found < 0) printf("Could not get socket info.\n");

  printf("%d\n", a.sin_port);

  close(sock);

  return 0;
}
