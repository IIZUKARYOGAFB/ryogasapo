#!/bin/bash
# りょがサポ ローカル確認用ランチャー
# これをダブルクリックすると、ローカルサーバーが立ち上がってブラウザが開きます。
# ※ index.html を直接ダブルクリック（file://）で開くと Adobe Fonts が
#   読み込まれないため、必ずこちらから確認してください。
cd "$(dirname "$0")" || exit 1
PORT=4173
URL="http://localhost:$PORT/"

if lsof -i :"$PORT" >/dev/null 2>&1; then
  open "$URL"
  echo "既にサーバーが動いていたので、ブラウザで $URL を開きました。"
  echo "このウィンドウは閉じてOKです。"
  exit 0
fi

( sleep 1; open "$URL" ) &
echo "ローカル確認用サーバーを起動しました → $URL"
echo "スマホ幅の確認は、ブラウザの幅を狭めるか、開発者ツールのデバイスモードで。"
echo "確認が終わったら、このウィンドウを閉じてください（サーバーも止まります）。"
python3 -m http.server "$PORT" --bind 127.0.0.1
