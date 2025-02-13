# 🗿 Thwomp

A sentient stone block that blocks you from accessing web servers.

Or in other words, a rudimentary hand-rolled maintenance mode.

### Assumptions

This silly stone block has quite a few assumptions:
- You're using some sort of load balancer or proxy
  - For HCB, we have a Hetzner Load Balancer in front of our servers
- You're able to configure the target of the LB/proxy
  - For HCB, we can easily add/remove server ips as targets of the LB
- You can deploy this Dockerfile to a server
- SSL is terminated at the LB/proxy (e.g. this Nginx server doesn't need to
  handle SSL)

### How to use it:

1. Deploy this
   For HCB, we use Coolify. We give it a dedicated server and port map `80:80`
2. Remove all existing servers from load balancer
3. Add this server to load balancer. This should be the only server.
4. Your users get thwomp'ed with a maintenance mode page!
