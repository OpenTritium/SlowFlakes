{
  pkgs,
  inputs,
  platform,
  ...
}:
{
  fonts.packages = with inputs.hypr-polkit-agent.packages."${platform}"; [ apple-fonts ];
}
