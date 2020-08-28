UWEBSOCKETS := uWebSockets
USOCKETS := $(UWEBSOCKETS)/uSockets
USOCKETS_OJB := $(USOCKETS)/*.o

CXXFLAGS := -std=c++17 -I$(UWEBSOCKETS)/src -I$(USOCKETS)/src
LDFLAGS := $(USOCKETS_OJB) -lssl -lcrypto

SRC := main.cc
PROG := prog

all: $(USOCKETS_OJB) $(PROG)

$(PROG): $(SRC)
	$(CXX) $(CXXFLAGS) $< $(LDFLAGS) -o $@

clean:
	$(MAKE) -C $(USOCKETS) clean
	rm -f $(PROG)

$(USOCKETS_OJB): $(USOCKETS)
	$(MAKE) -C $< WITH_OPENSSL=1
