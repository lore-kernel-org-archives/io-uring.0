Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640990;
	b=BVOHEVhmf7S5bbLyF8ManBAjDR0QwHTKgBOpW7a8WDrWZeUIGcFcyVnD+WdIaHYj7O5r
	 /Jig5x4rhz/o7Em6Le5K458SE/34VO+BiYL5R6pEhjvH5WwFV+MFesy/Vix8H28tJVqUf
	 nT8VbM++Lit8bNZttJIfQLFKe2snncRhndynAnwEdXX1bQNXXTfhXiAKvUd+jZly7531G
	 hj9WWohGw2sT2mutLt0lmUsM9n1/ym3o6e23M3zs6Bxz8k+r3uKUr43zR7d5vLhtrnkkN
	 +xqmtMKZYFPLpRPS8/7Nf78x95gEbuIxWQsgNs0tFkFYH1eoJn/82/UbevQ3YqKNLtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640990;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:Sender:X-CM-SenderInfo;
	bh=/bg27bjm65CdbJJ+TqHQGFg4ccpkg1yc79s7WA1+zYQ=;
	b=C0mTQP6n/76cdlcP/yNfo4oEt2ZrTjgb6QI9jLMGjBKRKXjXCfoW6E0OshCZc8vL+nMc
	 89iG+snXjw3MlJHvsSoVo1NEh/BI2QMfXHhUJV7mDTf0Ht7vssdHPmPFhjQGueYxkZ6uX
	 KhjP6kfRKCSDxvx9rZcORMxK4uqVgohZnNS47SjydJXEzw1y8NYeFCI+E6+R4Ro72nB4S
	 jfscCVfTrIg8DmIfj03Y/n4pxj/UPDjxknmAmZfBW51bldrxL/KVXMoqNQHWD+L+/xpIn
	 DcMHkZc4Z8OAM3WiiyT6GWiT+M8nzVUIx3zvTimng/VRzdWzuGXyyv/nAGYG8b4ChDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iUo58z9c;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C842D606A32D
	for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 07:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C842D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iUo58z9c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=/b
	g27bjm65CdbJJ+TqHQGFg4ccpkg1yc79s7WA1+zYQ=; b=iUo58z9cOAu/jzchxM
	awsSLW6AOoI3hu8u8958/iDnClQcRwvuC0VI/QeOawW2Ks47BE5ucPbTHAjXzLEn
	kO7OHbmWi250QquSgo49WVTqmItb3KgalTJd+06kQWp8pS15Qu09sEJyLVTBfXMt
	rDxMW7LImXjAOW2RlwxNHIH+A=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v9tIDPhqC2tdHA--.18420S2;
	Sat, 14 Nov 2026 15:22:49 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: [PATCH 0/2] io_uring: fail soft links on more completion paths
Date: Sat, 14 Nov 2026 15:22:44 +0800
Message-Id: <20261114072246.741950-1-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v9tIDPhqC2tdHA--.18420S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrAF43Gr47GFWUKFWkCrWUXFb_yoWxWwc_u3
	yjg34xZr1xXF4UAa18Ca1FqF1Ykr4rAF15WrWDJr17XFy5Aa95CrZ5JFySka43X3W2qa43
	Grs5ua4Yya4a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbwvKUUUUUU==
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbC6gntfmr4DEnLjAAA3g

Follow-up to the previously sent:

  io_uring: fail soft links on negative IOU_COMPLETE results

That patch restores req_set_fail() for the common IOU_COMPLETE exit.
After sending it, other completion paths that never go through that
exit were checked for the same soft-link gap (with AI-assisted review).
Two more sites still complete without failing the link: futex wait
cancel and IOPOLL short or error IO.

Yang Xiuwei (2):
  io_uring/futex: fail soft links when cancelling a wait
  io_uring/rw: fail soft links on IOPOLL short or error IO

 io_uring/futex.c | 1 +
 io_uring/rw.c    | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.25.1

