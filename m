Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738ED25B09E
	for <io-uring@vger.kernel.org>; Sun, 19 Jul 2026 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471987; cv=none; b=QTltS0rshRCyaVMry0gIYAAEtX336dk246eB4QNfisovO67cOhahKFdCON5qGmg/c0CHehfmATgD7fnyW4ergyv8fAvo+HBnoldu321nPOE3uPWXRSXs336wmxup0E1Jnut6PnCXb8nACtqTaOUhuW4hzDMdE86V0P36eni7PL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471987; c=relaxed/simple;
	bh=qle3Uq8MVus2QBaHFnUeRpNbPNW1XSW6m5T4EQ2aft4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=bqsZP6OkFOg8PpCYggclz008x+qgHdSUK8CjwkOobQkkLw8VaysRr/2JQXD9vEBSTsYpnfgnUgB+GKu5fukKExZJbakDMi1skrbJAuui9BKuJC3iW9WTQlzG7upNblzu8vFq8VJOoKQL/NUnYlXVo9ixCYO/NYIHJdlm0lvQ7SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=BVlfMIG4; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="BVlfMIG4"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6a38d7904b7so5592249eaf.2
        for <io-uring@vger.kernel.org>; Sun, 19 Jul 2026 07:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1784471983; x=1785076783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LxmkR4KvQMLAzilJo8QW7jzs627CtrPTI7znkL6nobE=;
        b=BVlfMIG4R3L61g737E2VIx6ArqjTUf2CaanZeyEt0gTSCKcapMOO55xa3Hj2KCCmOj
         FFca/dCTjjrJG+fhLsFDpGxsvvg/1/H3IGwnu5jsqKs5J6Au4FcYs2I0gHtMUOnUxuH3
         GivvKx+XUyxcozch5Nr1y10nu4yUcHQGHGLzr8Fb67JY9sY93zixk1PFh2Gfyi1WnGTL
         hFoUNGUC4nfR3v+EBPO/+1Ih1l5mkdFM+QQgqGP/JEps36BLJYHU7JI4gIYFRz29Pk8x
         8vgVcCoe29bbaCf9xYm9c0jODPeVrRpMcquRzOaM908QO2vqwrga7W1Fq8VIOgPC0OsJ
         /6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784471983; x=1785076783;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LxmkR4KvQMLAzilJo8QW7jzs627CtrPTI7znkL6nobE=;
        b=N/8GfMxHA8KOfILMm1mwlG57fBBI1iRsWW6T8fzl66K9kjTjiRc20hR4PuFS8dPHAn
         zVi95ptQsVHYKVRnGVFRLoakLx0GEZi98LbylxcVSdIZvtwfBeapxxl8svkjZMJIsx2X
         LO9gppv4eAP/KMNYRuJQWBWnOLdu4gTdo4pJcOY+iY2wg4jm0tSVFaM3j2CTINRUCYqz
         4MteWD7RM0DWgfEwxRUp2nzHewb9ZqCJybPPqwI1cca1lQ3FIJekxD5qXrsGbKX2r/u7
         WD5VeQFI/2QeP6FlXEd0b6gqOLRu15DibDTk1tLkd0REozmkVBUxLNBJNSAGh6r5/2bE
         mMXw==
X-Gm-Message-State: AOJu0YyUjtN2QLZIrU/yw5VRkQ+wNeYc+EzQXxOkIDecv0SsadB2jinR
	ES6MkbmscWgtm/YuqpuaAzIiEDeXCA1r+EDxyRE30Jlb6rye2l+DS9IgoWNIHTlJNCdlJcsWRjL
	JKxEMJL8=
X-Gm-Gg: AfdE7ck6EWxnVwNZXCUXfYotEUI+Uql37woAQfd+Ncc3twRLSFsVepQMkljYaIrKwg3
	QMqyHTMBmDycys1De2P3s6S5pF6R0fMJnx5tqZw2J8ibfenL5bjK8uzRhl1oJ/87f9UoMlM6Mgt
	zxagT/nb9BDCBVjmqgqOYzTLjtDfhySLvfz7+/r6bPFAhCjjbINwD0MdCfotZz+K3z4XJLK27en
	hZl99doN0phffO1rugDwSAEIFocY/4jMdZn/tsGEvaFCJYTsJlZzM/X7omo0QUPt6agl/wTxA99
	H/9OIka40VkufGBenDHskpLXmNGnexN22xFeKNLygIbEpZO/2xeVrfalAnYA2i6aQkuf33ARWhY
	NIbUjVrQj6Dk7E+VMpKGU8QH1CBrKZvFlXH4VBvdlXquQikYsc2/53s7UZ6ONZqbmoLuDn495m9
	0EAfCkFJ2MmLOd2qCvrvfuWJWKmlmUCIXkCjK1r4Oztq1QNvijRzUXVtqaV+o=
X-Received: by 2002:a05:6820:f08:b0:6a1:98e6:a8f5 with SMTP id 006d021491bc7-6a536877936mr5394119eaf.36.1784471982934;
        Sun, 19 Jul 2026 07:39:42 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a51a220cbasm5767955eaf.9.2026.07.19.07.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 07:39:41 -0700 (PDT)
Message-ID: <6c68b461-0e7b-45ed-8e13-d7b7fd29b65b@kernel.dk>
Date: Sun, 19 Jul 2026 08:39:40 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: io-uring <io-uring@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [GIT PULL] io_uring fixes for 7.2-rc4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

A small set of io_uring fixes for this week. This pull request contains:

- Fix a use-after-free in the bpf-ops struct_ops path, where the same
  io_uring_bpf_ops map could be registered more than once.

- Fix the deferred iovec free for the provided-buffer grow path, which
  could leave the caller with a dangling iovec and result in repeated
  frees. Follow-up to the earlier fix in this series.

- Zero-check the unused addr3/pad2 SQE fields for unlinkat

Please pull!


The following changes since commit f3176c8ac4217c88fe1147ab084c47092921ffc4:

  Revert "io_uring: grab RCU read lock marking task run" (2026-07-09 11:43:07 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git tags/io_uring-7.2-20260717

for you to fetch changes up to 3afc64c61ce906a04f073ca350b46de10e8302f9:

  io_uring/bpf-ops: reject re-registration of an already-bound ops (2026-07-17 11:17:54 -0600)

----------------------------------------------------------------
Jaeyeong Lee (1):
      io_uring/kbuf: free the replaced iovec after a successful grow

Woraphat Khiaodaeng (1):
      io_uring/bpf-ops: reject re-registration of an already-bound ops

Yi Xie (1):
      io_uring/fs: check unused sqe fields for unlinkat

 io_uring/bpf-ops.c | 2 ++
 io_uring/fs.c      | 3 ++-
 io_uring/kbuf.c    | 4 ++--
 3 files changed, 6 insertions(+), 3 deletions(-)

-- 
Jens Axboe

