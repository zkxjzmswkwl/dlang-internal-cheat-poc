import core.sys.windows.windows;

alias _function = extern(C) void function(const(char)* text);

void write_chat(const char* input)
{
    _function tmp = cast(_function)0x46B060;
	tmp(input);
}

int* getPlayerCount()
{
	return cast(int*)0x10F4Fc;
}

 bool isEntity(Entity* potentialEntity)
 {
    if (potentialEntity)
	{
        if (
			potentialEntity.vTable == 0x4E4A98 ||
			potentialEntity.vTable == 0x4E4AC0
		) {
            return true;
		}

	}
    return false;
 }


struct Entity 
{
    DWORD vTable;
	float x; //0x0004
	float y; //0x0008
	float z; //0x000C
	char[44] pad_0010; //0x0010
	float yaw; //0x003C
	float pitch; //0x0040
	float roll; //0x0044
	char[176] pad_0048; //0x0048
	int health; //0x00F8
	int armor; //0x00FC
	char[60] pad_0100; //0x0100
	int pistol; //0x013C
	int carbine; //0x0140
	int shotgun; //0x0144
	int machinegun; //0x0148
	int sniper; //0x014C
	int assaultrifle; //0x0150
	char[209] pad_0154; //0x0154
	char[16] name; //0x0225
	char[559] pad_0235; //0x0235
}

struct EntityList
{
	Entity[31] * players;
}

struct Position
{
	float x;
	float y;
	float z;
}
