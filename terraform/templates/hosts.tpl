[${master_host_name}]
${master_host_name} ansible_host=${master_host_ip} ansible_ssh_private_key_file=${master_path_to_private_key}

%{ for nodes in worker_nodes}
[${node.host_name}]
${node.host_name} ansible_host=${node.host_ip} ansible_ssh_private_key_file=${node.path_to_private_key}
%{endfor ~}