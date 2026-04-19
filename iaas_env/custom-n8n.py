import sys
import urllib.request
import urllib.error

def main():
alert_file = sys.argv[1] if len(sys.argv) > 1 else None
api_key = sys.argv[2] if len(sys.argv) > 2 else ""
hook_url = sys.argv[3] if len(sys.argv) > 3 else ""

if not alert_file or not hook_url:
raise SystemExit("Missing alert file or hook URL")

with open(alert_file, "r", encoding="utf-8") as f:
alert = json.load(f)

payload = {
"source": "wazuh",
"rule": alert.get("rule", {}),
"agent": alert.get("agent", {}),
"manager": alert.get("manager", {}),
"decoder": alert.get("decoder", {}),
"data": alert.get("data", {}),
"location": alert.get("location"),
"timestamp": alert.get("timestamp"),
"full_alert": alert,
}

req = urllib.request.Request(
hook_url,
data=json.dumps(payload).encode("utf-8"),
headers={
"Content-Type": "application/json",
"X-Wazuh-Key": api_key,
"User-Agent": "wazuh-custom-n8n/1.0",
},
method="POST",
)

with urllib.request.urlopen(req, timeout=10) as resp:
print(f"HTTP {resp.status}")

if __name__ == "__main__":
main()
