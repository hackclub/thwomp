<img align="left" width="50" height="50" src="https://static.wikia.nocookie.net/nintendo/images/7/79/ThwompMKL.png/revision/latest?cb=20220912195412&path-prefix=en">

# Thwomp

A sentient stone block that blocks web traffic from accessing your servers
during maintenance periods.

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

### How to use it

1. Deploy this

   For HCB, we use Coolify. We have it deployed on all the same servers as HCB
   and port mapped to `81:80` (81 on host, 80 in container).

   Here's why:
   - Instead of adding/removing servers from the LB, we can simply switch the
   target port that the LB sends traffic to.
   - By switching the target port to 81, it means that all target servers in the
     LB must respond on port 81, and thus Thwomp must be running on all servers.
2. Go to the load balance and update the service to target port 81 instead of
   80.
3. Your users get thwomp'ed with a maintenance mode page!
