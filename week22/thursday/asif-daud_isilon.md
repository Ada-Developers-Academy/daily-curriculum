(These are rough notes that Kerri took during Asif Daud's talk about Isilon. We'll replace this with his actual lecture notes once he delivers them to us.)

---

Asif Daud
Isilon

8 years at Isilon

Distributed processing and storage

## The Opportunity
NAS - Network Attached Storage
"Who thinks storage is boring? Hey, me too when I started!"
It's important, and has its own unique technical challenges that make it really interesting and exciting space to work in.

"Big data" is a buzzword, but its important, and a good opportunity for a business.

From 100,000 BCE to 2003, humans generated 5 exabytes (1,000 terabytes) of data
At the end of 2013, humans were producing 5 exabytes of data every 10 minutes (!)

Where do we store it all? What do we DO with it?

Where does the data come form?
+ mobile sensors
+ social media
+ video surveillance
+ video rendering

What has Big Data done for us?
+ smart power grids
+ geophysical exploration
+ medical imaging
+ gene sequencing

Social media is a huge factor 
+ images
+ video
+ audio
+ blogs
+ articles
+ shares

meta-data - data /about/ the data, is where there's value

"We don't have better algorithms, we just have more data"
Peter Norvig, Google's research director

2 kinds of data

### File-based data
files and folders with names

### block data
AKA Structured data
email, databases, etc


## The Company
founded in 2001 here in Seattle by 2 Real Network engineers
Saw the future growth in data and saw a need for someone to figure out how to manage all the bits

first shipped a product in 2003 (UW)

Went public in 2006 - biggest tech IPO in Seattle in 10 years

Acquired by EMC in 2010 for $2.5B

[riffed for a while on EMC and the other companies they own, like VMWare and Pivotal]

1300 employees
"Proven, Global leader"
7th generation of their product
4,000+ customers

They offer a file system of 20+ petabytes (more than 10 times larger than the largest IBM storage system, AND 4 times faster)



## The Product
OneFS (FS = File System)

Drives are the most likely thing to break, so clustered, RAID systems are best

Designed for File-Based storage and workflow

There's big advantages to having everything in one file system rather than having it scattered across different servers
- less maintenance
- easier for humans to understand
- computationally simpler

NAS - specialized hardware device that you just put into a rack in the data center and connect it to your network. Drives are connected internally with superfast internal networking for high availability and consistency

cluster architecture - lots of computers or devices working together seamlessly that appear to be a single device to the outside world

each machine has lots of redundant parts that can take over if another piece fails (fans, power supplies, etc)

### OneFS
+ is based on FreeBSD (like OSX)
+ is a loadable kernel module (you can add it to other *nix systems)

### storage concepts

File Storage concepts
- parity - ???
- mirroring - duplicating data in multiple places
- striping - dividing redundant data across multiple disks

Parity isn't enough. Mirroring is expensive. Striping is most resilient, because a drive can go bad and you can reconstruct it invisibly. Striping is also faster because you can parallelize data access

OneFS does all three.

3 different levels of mirroring:
+ Nx
+ "Reed-Solomon Coding" N+M
+ N+M/B

Drives fail more often than nodes, so hardware redundancy is key to protecting data against loss.

Saving a file into a OneFS cluster scatters copies of pieces of the file around the different drives in the cluster - more efficient and faster than having 2 copies of the file.

Reading a file the cluster reassembles the file from the different drives on the fly.

The largest possible OneFS cluster is larger than the largest requested by any customer or company ever.

## Q & A
Q: Talk more about Block oriented storage ?
A: SAN - Storage Area Networks - is usually what's used for large databases. more expensive and harder to maintain than OneFS, but very specialized.






















