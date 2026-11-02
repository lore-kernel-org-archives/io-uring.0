Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793582331;
	b=p8DmnhAFQfQWfvHoZGSbScYtg5ndF25EAJFwaIBdo48TXmkC/ad9yiN5bazFE9j+h8dr
	 3WQPRSCLPunZTlKhuhok3Ebkcd3WXw+Z9lJhtnf5j/dhEkv70TK65dkYvnbq8N7OGTvZP
	 ztWC9U/oVjjG3/AY1AGpeaq8jufl2PxD9sVhvmfotT9hWVa2lSsiUWSZvnYTJszgyASB8
	 qzixf5/dDW5Uj1v2smPMd9oio8kzEd+XigqP0HV8DLEA9IJ/GskWvy8U6cyJL/4HHBQhy
	 hm9F7E7d+8ZGwrY8VfKuClf7JGSbmuH+bWYhdEvqxJjoIvWBLOK1xWD1wDwjtn7g9yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793582331;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=B9YH79KCTKiv4AlQ7uID8Gx4ChFaDTlswpBafBUCc1o=;
	b=cDje4dn3Gb+5DDhkuVRdM1OJUva31DM56sYjtT1qBTZ9HgTvzW8zieq+Ob32LbGdZC9+
	 KXR0FzN099gXk2gfrC+V0NEAkf3MrgrPMFT7qnKphly/vdZUthvArtCEKTp0mhFSAXIqH
	 BtmF5KUBKl45qTXiTYRmOo3OcEOHE1NQxKDiuY9Obh+X88lB6GETYzF2GzVi6WRGIV+q7
	 1axH5WlH0hHPb8SIu/fnZUgnxtrjMbqUnpFvhlhorL5+giRZPiNoD9mYuO/fYHY8Yps3s
	 Bhnxxwf27ED8KgyVn0D32luiY6b8IQ54xOzg/im9QNna+S+PGdlIbRo2Z65qNp0+AbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MOkKpls5;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B5C606A338;
	Mon,  2 Nov 2026 01:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B5C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MOkKpls5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793582318; x=1825118318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ilBh4wTVpcjqcX0IWQJ5k45bfq2sai2jB8UvSpiIr9E=;
  b=MOkKpls5YTjmIjxrEj10ADjZ3E97r/T0N5+3Hmjors3qPuxi5waNxVGK
   yORIQH12QLbyFJ5EGBVPxnJHqig6/+Kb/5uPW2E2GPJtO9rhewYdjbbBJ
   saeZTE8SQ7feH/GdWsYj/ahYWfk8A5vsththi1qRBJMWdeAa2Zc1s80ys
   bvsSK14ab4GS4wultI2+Y+DCcfBR7I0t6J9O8ivBMupNhgIZX6uu1KDvY
   p5U9zdNloh0UWgfjxJVylDJ6kA6N3n+2LOKhZithQ84xjE/zQBQ3NhypN
   SdWxcZzGckLA+TrOlp6u0WyZss31C5McC3V4xvKnHEke/za3d5ztQz4IE
   w==;
X-CSE-ConnectionGUID: VZ7s/grvTkSiSd0bloNVAQ==
X-CSE-MsgGUID: LsRzfbtvS1ubygsMXfUcYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2148318"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2148318"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 17:18:37 -0800
X-CSE-ConnectionGUID: e2mMyKrhTD67Fda/B9mYJw==
X-CSE-MsgGUID: zvPNtv3GS2Cuvp1Ltvb2TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="6077675"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 17:18:35 -0800
Date: Mon, 2 Nov 2026 09:18:32 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>, io-uring@vger.kernel.org,
	yi1.lai@intel.com
Subject: [linus:master] [io_uring/sqpoll]  22d9db9fd6:
 WARNING:at_io_uring/sqpoll.c:#io_sq_thread_stop
Message-ID: <202611020832.6be281-lkp@intel.com>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Hello,

kernel test robot noticed "WARNING:at_io_uring/sqpoll.c:#io_sq_thread_stop" on:

commit: 22d9db9fd64a493525d692b32c556875b7254665 ("io_uring/sqpoll: don't attach to a thread that is canceling") https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

in testcase: trinity
version: trinity-x86_64-24d3003cd-1_20261026
with following parameters:

	runtime: 600s

config: x86_64-kexec
compiler: clang-22
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 4 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202611020832.6be281-lkp@intel.com


[   26.587414][   T45] ------------[ cut here ]------------
[   26.589928][   T45] WARNING: io_uring/sqpoll.c:88 at io_sq_thread_stop+0x51/0x70, CPU#2: kworker/u16:1/45
[   26.594244][   T45] Modules linked in: cn scsi_transport_iscsi can tun sr_mod cdrom sg ata_generic fuse
[   26.598751][   T45] CPU: 2 UID: 0 PID: 45 Comm: kworker/u16:1 Not tainted 7.3.0-16149-g22d9db9fd64a #1 PREEMPTLAZY
[   26.603843][   T45] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   26.609058][   T45] Workqueue: iou_exit io_ring_exit_work
[   26.611968][   T45] RIP: 0010:io_sq_thread_stop+0x51/0x70
[   26.614851][   T45] Code: d5 9f a0 00 49 8b 7e 38 48 85 ff 74 12 65 48 8b 05 bc 67 1b 02 48 39 c7 74 14 e8 7a 5e 97 ff 48 89 df 5b 41 5e e9 2f a0 a0 00 <0f> 0b eb c4 0f 0b eb e8 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00
[   26.649711][   T45] RSP: 0018:ffffc90000197d88 EFLAGS: 00010202
[   26.653681][   T45] RAX: 0000000000000001 RBX: ffff88811dd85b80 RCX: 0000000000000000
[   26.662253][   T45] RDX: 0000000000000001 RSI: 0000000000000246 RDI: ffff88811dd85b80
[   26.668755][   T45] RBP: ffff888113d26c00 R08: 0000000000000000 R09: 0000000840670f01
[   26.674920][   T45] R10: 0000000000000000 R11: ffffffff81311c10 R12: ffff888113d26be0
[   26.681428][   T45] R13: ffff888113d26bd0 R14: ffff88811dd85b80 R15: ffff888113d26ac0
[   26.686241][   T45] FS:  0000000000000000(0000) GS:ffff8884ac1d0000(0000) knlGS:0000000000000000
[   26.690638][   T45] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   26.693882][   T45] CR2: 00007fc4f47f2748 CR3: 0000000166ff4000 CR4: 00000000000406f0
[   26.697813][   T45] Call Trace:
[   26.699320][   T45]  <TASK>
[   26.701367][   T45]  io_put_sq_data+0x29/0x70
[   26.703371][   T45]  io_sq_thread_finish+0x82/0xb0
[   26.706484][   T45]  io_ring_ctx_free+0x10/0x270
[   26.708922][   T45]  io_ring_exit_work+0x131/0x230
[   26.711067][   T45]  ? __pfx_io_tctx_exit_cb+0x10/0x10
[   26.714184][   T45]  process_scheduled_works+0x200/0x430
[   26.717583][   T45]  worker_thread+0x1bd/0x2b0
[   26.722123][   T45]  ? __pfx_worker_thread+0x10/0x10
[   26.732821][   T45]  kthread+0xfe/0x130
[   26.740731][   T45]  ? __pfx_kthread+0x10/0x10
[   26.744642][   T45]  ret_from_fork+0xe0/0x1f0
[   26.747511][   T45]  ? __pfx_kthread+0x10/0x10
[   26.754281][   T45]  ret_from_fork_asm+0x1a/0x30
[   26.757373][   T45]  </TASK>
[   26.765995][   T45] ---[ end trace 0000000000000000 ]---


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261102/202611020832.6be281-lkp@intel.com


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


