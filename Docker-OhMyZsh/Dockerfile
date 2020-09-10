FROM debian:latest
MAINTAINER me
WORKDIR /root/
RUN apt-get update -y 1>/dev/null && apt-get install -y apt-utils vim dnsutils zsh git curl wget 1>/dev/null && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 1>/dev/null && sed -i 's/\(ZSH_THEME=\).*/\1"cypher"/' /root/.zshrc && sed -i 's/\(PROMPT=\).*/\1"%n%{${fg_bold[red]}%}::%{${fg[yellow]}%}%3~%(0?..%{${fg[red]}%}%?)%{${fg[orange]}%}>%{${reset_color}%} "/' /root/.oh-my-zsh/themes/cypher.zsh-theme
EXPOSE 5555:5555
