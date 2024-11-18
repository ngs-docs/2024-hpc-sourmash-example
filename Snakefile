QUERY, = glob_wildcards("{q}.fa.sig")

rule all:
    input:
        expand("{q}.csv", q=QUERY)

rule run_query:
    input:
        sig = "{q}.fa.sig",
    output:
        csv = "{q}.csv"
    threads: 2
    shell: """
        sourmash scripts manysearch {input} \
            /group/ctbrowngrp/sourmash-db/gtdb-rs214/gtdb-rs214-reps.k31.zip \
            -o {output} -c 2
    """
