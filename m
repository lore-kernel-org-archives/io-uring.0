Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635DE42E8D6
	for <io-uring@vger.kernel.org>; Thu,  2 Jul 2026 08:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981023; cv=none; b=tEqrshnav1rPllCuiaz+Z8CbGwK2F7iBnVFuDXex8ugMBgok1ySD69PDC9LRWHL5tpv7/xHqYsbSzfxf0ZFqjwt724bgLA6MBWrPj76+PUXK8oMN7C467rS/XZrsodS7GM3hZACJ6ONWxBxy3QyllKvrUKrpixFdFhRIFxn+d7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981023; c=relaxed/simple;
	bh=5wZlGS4YhLti1YkSq19P+yAeHLvlDrgwEVzypPJR6LQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NUIEuOrzRNDcDY8Lz7SjPIiWhv6JVe24fe8DlMrDD254Wd69e7joThfhj+hzmTlZQIsXL9ESqWmx78usOGpXh50xF5yJ5mpqqrpNHTpeFJVmOJrkxxykcA+1MeBPabyqubLG9akDXWZUoFDKUTAam8s35FGGor/cF5Zv1TMykjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jiqnZea9; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jiqnZea9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Kq
	hNVbw0oRAGTaqcxuJURD7Mw0BrvUPgywmWCqxbj3w=; b=jiqnZea9qhVG/Fgtn+
	f7ko9EeFkUe7WGzj+sxJFlMxhsuLXcgjcLloUyrxegCmq+LXzVZ8zq2vUSvC+oXk
	VsAHba1y3ShxJcA9ENgKM978e1LJoLHrTZAPGkawrqjPDrdqTUWJIDuk1L3CPu0o
	wO20/CvoMyPKXrag9mLFBkQIA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnH0R0IUZqmPUCHA--.22854S2;
	Thu, 02 Jul 2026 16:29:41 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH 0/2] io_uring/uring_cmd cleanups
Date: Thu,  2 Jul 2026 16:29:35 +0800
Message-Id: <20260702082937.3707134-1-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnH0R0IUZqmPUCHA--.22854S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrWUtr4UCr1kAry8ZF4fZrb_yoW3Xrg_Cr
	Z5G3yxWrW7XFWqv3W7Cw1rXr1rK3y7AFWUXr1fJry7Ar17AFykG395Gr4fJFsagF1IqF13
	GFZ8A3sayryagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRR_HUtUUUUU==
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbC6RaRImpGIXZiqAAA39

Two small io_uring/uring_cmd cleanups:

- copy the SQE into async data in io_uring_cmd_issue_blocking()
  before punting to io-wq, as the -EAGAIN and fallback punt paths
  already do (discussed in May [1])
- fix comment typos in io_uring_cmd_mark_cancelable() and correct
  the memory-ordering note in __io_uring_cmd_done()

The sqe_copy fix still has not made it to mainline; sending this series
in case it is still useful.

[1] https://lore.kernel.org/io-uring/56388741-f507-44e3-a144-5512a1fd99cb@kernel.dk/

Yang Xiuwei (2):
  io_uring/uring_cmd: copy SQE before issue_blocking punt
  io_uring/uring_cmd: fix uring_cmd.c comments

 io_uring/uring_cmd.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.25.1

