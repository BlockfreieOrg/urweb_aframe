PACKAGE_NAME=app
DB_PATH=$(PACKAGE_NAME).db
EXE_PATH=$(PACKAGE_NAME).exe
SQL_PATH=$(PACKAGE_NAME).sql

all: $(EXE_PATH)

$(EXE_PATH) $(SQL_PATH):
	urweb $(URWEB_FLAGS) -db $(DB_PATH) -dbms sqlite $(PACKAGE_NAME)

$(DB_PATH): $(SQL_PATH) $(EXE_PATH)
	rm -f $(DB_PATH); sqlite3 $(DB_PATH) < $(SQL_PATH)

clean:
	rm -rf $(DB_PATH) $(EXE_PATH) $(SQL_PATH)
