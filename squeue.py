#!/usr/bin/python
# Author : Ali Snedden
# Date   : 11-nov-2024
# License: GPL-3
# Purpose :
#   This output's nicely formatted from squeue and INCLUDES the total number of GPUs
#
# To Run :
#       python squeue.py
#
import os
import sys
import datetime
import subprocess


class Job:
    """
    """
    def __init__(self, jobid : str = None, part : str = None, jobname : str = None,
                 user : str = None, state : str = None, time : str = None,
                 nnodes : str = None, cpus : str = None, mem : str = None,
                 nodelist : str = None, ngpu : str = None):
        """
        """
        #self.jobid = int(jobid)
        self.jobid = jobid
        self.part  = part
        self.jobname = jobname
        self.user  = user
        #self.time  = datetime.datetime.strptime(time, "%Y-%m-%dT%H:%M:%S") # aspirational
        self.state = state
        self.time  = time
        self.nnodes = int(nnodes)
        self.cpus  = int(cpus)
        self.mem   = mem            # Leave as string for now
        self.nodelist = nodelist    # Actually parse later
        self.ngpu  = ngpu

    def print_job(self):
        """
        """
        print("{:>15} {:>8} {:>10} {:>8} {:>3} {:>12} {:>5} {:>6} {:>6} {:>20}".format(
              self.jobid, self.part, self.jobname, self.user, self.state, self.time,
              self.cpus, self.mem, self.ngpu, self.nodelist))

def main():
    """

    Args :

    Returns :

    Raises :
    """
    squeue='/cm/shared/apps/slurm/current/bin/squeue -a --sort=i -o "%.20i %.9P %.10j %.7u %.2t %.12M %.6D %.6C %.5m %.25R"'
    output=subprocess.getoutput(squeue)
    #print(output)
    lineL = output.split('\n')
    jobL = []

    header= lineL[0]
    for line in lineL[1:]:
        entry = line.split()
        jobid = entry[0]
        part  = entry[1]
        name  = entry[2]
        user  = entry[3]
        state = entry[4]
        time  = entry[5]
        nnodes= entry[6]
        cpus  = entry[7]
        mem   = entry[8]
        nodes = entry[9]
        string = subprocess.getoutput('scontrol show jobid {} | grep AllocTRES'.format(jobid))
        tresL = string.split(',')
        for tres in tresL:
            if 'gpu' in tres:
                ngpu = tres.split('=')[-1]
        job   = Job(jobid=jobid, part=part, jobname=name, user=user, state=state,
                    time=time, nnodes=nnodes, cpus=cpus, mem=mem, nodelist=nodes,
                    ngpu=ngpu)
        jobL.append(job)

    print("{:>15} {:>8} {:>10} {:>8} {:>3} {:>12} {:>5} {:>6} {:>6} {:>20}".format(
          "JOBID", "PART", "NAME", "USER", "ST", "TIME", "CPUS", "MIN_M", "GPUS",
          "NODELIST"))
    for job in jobL:
        job.print_job()

    sys.exit(0)


if __name__ == "__main__" :
    main()
