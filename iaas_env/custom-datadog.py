#!/usr/bin/env python3
import json
import sys
import urllib.request
import urllib.error


def main():
    alert_file = sys.argv[1].strip() if len(sys.argv) > 1 else None
    api_key = sys.argv[2].strip() if len(sys.argv) > 2 else ""
    hook_url = sys.argv[3].strip() if len(sys.argv) > 3 else ""

    if not alert_file or not hook_url:
        raise SystemExit("Missing alert file or hook URL")

    with open(alert_file, "r", encoding="utf-8") as f:
        alert = json.load(f)

    rule = alert.get("rule", {})
    agent = alert.get("agent", {})
    manager = alert.get("manager", {})
    decoder = alert.get("decoder", {})
    data = alert.get("data", {})

    rule_id = rule.get("id", "unknown")
    rule_level = rule.get("level", 0)
    rule_description = rule.get("description", "No description")
    hostname = agent.get("name") or manager.get("name") or "wazuh-manager"

    payload = {
        "message": f"Wazuh alert {rule_id}: {rule_description}",
        "ddsource": "wazuh",
        "service": "siem",
        "hostname": hostname,
        "ddtags": "env:prod,platform:wazuh,group:atomic_red_team",


        "wazuh_rule_id": rule_id,
        "wazuh_rule_level": rule_level,
        "wazuh_rule_description": rule_description,
        "wazuh_group": "atomic_red_team",
        "rule": rule,
        "agent": agent,
        "manager": manager,
        "decoder": decoder,
        "data": data,
        "location": alert.get("location"),
        "timestamp": alert.get("timestamp"),
        "full_alert": alert,
    }

    req = urllib.request.Request(
        hook_url,
        data=json.dumps(payload).encode("utf-8"),
        headers={
            "Accept": "application/json",
            "Content-Type": "application/json",
            "DD-API-KEY": api_key,
            "User-Agent": "wazuh-custom-datadog/1.0",
        },
        method="POST",
    )

    try:
        with urllib.request.urlopen(req, timeout=10) as resp:
            print(f"HTTP {resp.status}")
            print(resp.read().decode("utf-8", errors="replace"))
    except urllib.error.HTTPError as e:
        print(f"HTTPError {e.code}")
        print(e.read().decode("utf-8", errors="replace"))
        raise
    except Exception as e:
        print(f"Error: {e}")
        raise


if __name__ == "__main__":
    main()
