SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"
#sqlite3 a.db "select 0;"
#sqlite3 a.db < a.sql
echo "SQLite3学習　ビルドオプション動作確認（SQLITE_ALLOW_URI_AUTHORITY）"
echo "# CLI"
#echo "ファイル"
#sqlite3 file:///tmp/work/a.db ".tables"
#rm a.db
echo "## インメモリ"
./in_memory.sh
echo "# Tcl"
echo "## インメモリ"
tclsh in_memory.tcl
echo "## インメモリ（名前なし）"
tclsh in_memory_shared_name_1.tcl
echo "## インメモリ（名前つき）"
tclsh in_memory_shared_name_2.tcl
