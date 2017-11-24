# from oracle:orcl image
FROM cdsxt/oracle:orcl
COPY run.sh /root/
COPY setting.sh /home/oracle/
ENTRYPOINT ["/root/run.sh"]
