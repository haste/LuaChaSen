#include "lua.h"
#include "lauxlib.h"
#include "chasen.h"

static int chasenlib_sparse (lua_State *L) {
	lua_pushstring(L, chasen_sparse_tostr((char *)luaL_checkstring(L, 1)));

	return 1;
}

static int chasenlib_init (lua_State *L) {
	const char *format = luaL_checkstring(L, 1);
	int result;
	char *opt[6] = {"chasen", "-i", "w", "-F", NULL, NULL};

	opt[4] = (char *)format;
	result = chasen_getopt_argv(opt, NULL);

	lua_pushboolean(L, result == 0);
	return 1;
}

static const luaL_reg chasenlib[] = {
	{"sparse", chasenlib_sparse},
	{"init", chasenlib_init},
	{NULL, NULL},
};

LUALIB_API int luaopen_chasen (lua_State *L) {
	luaL_register(L, "chasen", chasenlib);
	return 1;
}
