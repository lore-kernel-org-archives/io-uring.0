Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751553;
	b=iRKbgQeoDPwfGnoC5oG4mo/kZGWeX+E7Z55nf8Fz+ETmuHJ+ZTZTV71xUDno9ls1fGhP
	 tSMHPYBLSsnJCk2Kl7UONmeb8NTHcHe6OMwfpIaEhVmtlPNTmYnY0YbJNIQPIUX7sp5Vk
	 q6funtPDlfgu+wARhTqmrfbal97JTUT6AK6UrCGivgNJi/VUthmW2+WRTAfBeAx4pNzCL
	 MJGRPsqnWJuMPsvxKQWy2owZvc/NwYzP7WCCnnXNHlAg2ij1c95xfig4JO4JhfwaqNIVq
	 WA6LYTdghwRBGVHNyfMtfmDsPzuefWicoIPDUfr5pGdLalIUmJ3feIfbsu11P0W7FMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xkQ2a4rr4OfVHQ6kuJzVvVdC31NeQtZjjZjX0zJeTWI=;
	b=pkjIdbqNIcweozJ9MsXk2ONI+ARTnrSMBdjVXEnRH/gJOjGyhASVhPEC8TCC/MmRY9pK
	 qx4dBCCFk3tWOnCjnqTvcK31u/cKdnYvTVikTK1qXWqFN6B30mLlmml/mRw+lgjLAvhtz
	 iZoKeRB13eCwlRDhl7AgwmrnEAepebug//wnnDVN+EB2JmwmmAQ4gIi0ry/EgeB8m2407
	 PDBw90Nt9Px7sl4bwBpKvcvJiG+Jxlz3Z53Plkh0/HIH9koAHbLfaF/M3mMVa3206qi+w
	 vdlDYusEjphHuZrVDxngHY5XNC1JJaI6blIHKyxP/opkp2IarOZlKcANwZq4v+kDlqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nua3l3Lz;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635D9606A326
	for <io-uring@vger.kernel.org>; Wed,  4 Nov 2026 00:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 635D9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nua3l3Lz
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e0d1da913so25000f8f.1
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 16:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793751552; x=1794356352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xkQ2a4rr4OfVHQ6kuJzVvVdC31NeQtZjjZjX0zJeTWI=;
        b=nua3l3LzXH5sC9A6SJ9iKsthhz+gzmmes08RfX+Km6fub4LXy2WKga81YLv/KZCWh8
         aXCZIIS81A56KCQkdxYaQNk5KHgirFO47zSnsfkrTpI8Z2AFJ47Q48Yw6MG+mXUKNu9J
         7EYoJk7ILdJjyCu6Aejpdt5y38qkkDrNjk4xAeA3yIuYCixIdbBtd+K62+4bta72poy4
         GWeWprgrZ9BdD55agKUAF1VFYRsPQrgK703f6xRrYn6zCVxoijW2mmd95cLOAZyFHT7F
         WT9RigCUK7rGvk9in63j78CQ5ytxfWfGFNCbaMfe6VQIjtgNRpE7kyEJsYjkXjeukJ30
         Lm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751552; x=1794356352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkQ2a4rr4OfVHQ6kuJzVvVdC31NeQtZjjZjX0zJeTWI=;
        b=foD4STgEw1jYS9kw4xe+OVgO5ADL5LhcCjAik3ykWJsUN3H2b9Iv91gPj0lGVKeW8A
         H2hCBGMrLgE64KfnqqLRz4aNnp1lYcBwvMX8qxe3Epl+JZc4Tp6hRmcfxYVd8aDNAK7j
         luSQ5P2Rjfin/cWlQqhlbjYmXRm6vhU5aSlwNzKV7EUJRA0mF9aEm62PFImtnmub68Vx
         WW/Sx9b7HTD0RvnXtZuP3uMgjsUDMqgvKmoO3k/6eJFRwreNKxJ2aZVQ7wJJWjrpXenu
         0XwP+dO3Ny3TnS4vowmadCMHq+0gI5+zXUHIWaNwSJQ6elb1T/9VUUKBGZeuedVbFdXV
         y4ng==
X-Forwarded-Encrypted: i=1; AKwUvBwUWTeA1IYH1zIWr/Zj5F3mSBgoi5YOAcn0M+aDFYcOGtnOc5Fnveob9wLI8qMeb1Sken7yqboTfg==@vger.kernel.org
X-Gm-Message-State: APuU4Z991XbMMbw1lv15QIXsaPONl9FJ0kkgu23u8S4drIH7HcKBFxMr
	OHj1c4jwKbcRu0yyD8HONc49NOyPGU/GrqbdXniJzaJg8a9nBiQg5nNB
X-Gm-Gg: AYBFou1cbmvAQsyWJ9xvihwaWZ6j23vN+d3cngSAjBpDUMVrdtuFLkaBgumWqJALlKJ
	p/Oes1DqECd7Z7cYwpN5Gc5cnFArH62WVfhxUD9QTu8joK0blY3JQJ23j4R/n/HWwd49UbBreQ7
	N7bsX2Z84bwiEEqey1bPmoElz65z5Vs6T1NnvlHKHYbYS0I8PVw7/KLdJHaFx75WvN0YhsDeJMe
	IJe4jJPEQaxvqOBXnx0YaFBeLtDwEr8gbkAQDZima58glHQBr1RdeV2KPAQjqaC290a6eO/t9l4
	dLQstce1v/kR4vW8w7oSNiVkEpVINYiXViZrX7CLwYeuNpZZU+XLKVq/mzMB0ZmUSmFwD0jy0IW
	llVkLxA9H9EKpw4gGEHBbLPbjiv0y/vj6x6fB1uKlOzpkaapLtUZFt9JnNH3woB9QiGLQjWvj/u
	gAhBmsj9cOQsDxgCbRQgUjNcfd5PeHqDEBF/iLLJ/9soA1y8kXdP/CObQOsgyd+jB82nCvpkxQn
	dg8/NCaGAAYhXiRz4MvBpDGuTi6dejNgvPKciDuafAMhSvBecknfZwz2w43o5pkEnbnAc/cq4cQ
	auUkSwx43TeZNnBFscQmwe3EB40Z/dz6ejUeB9HqzuxFgOXZXSHxmTydgNoxA2Bovs0m0lPgEt0
	bhb0GT1sXKl7J2cF45pmXZxHrmNL7hU9s
X-Received: by 2002:a05:6000:3101:b0:48f:bbb5:61c2 with SMTP id ffacd0b85a97d-48fbbb563a3mr6701949f8f.4.1793751551597;
        Tue, 03 Nov 2026 16:19:11 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1fb0esm676676f8f.49.2026.11.03.16.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:19:09 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org,
	io-uring@vger.kernel.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>
Subject: [PATCH 0/5] allow dma-buf-io ctx reuse across files
Date: Wed,  4 Nov 2026 00:18:56 +0000
Message-ID: <cover.1793751001.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Currently, dma-buf maps can only be used by the file they were
registered with. This means that we can't open a new file, even if it
comes from the same subsystem and point to the same block device and
use it with an old dma-buf registration. That would be too restrictive
for upcoming filsystem support, so lift it now and allow reusing
contexts between files pointing to the same NVMe, even if they refer
to different partitions.

To do that, we add a tag representing for each file, save it from
the file passed during registration and use it to reject files
which tags don't match it. Tags are set by subsystems creating
files, should be unique and represent the instance of the
subsystem.

Pavel Begunkov (5):
  dma-buf-io: add tags for sharing ctx b/w files
  block: set dma-buf-io tag to block files
  io_uring: add data to dma-buf convertion helpers
  io_uring/dma-buf: switch to tag file filtering
  io_uring/dma-buf: get rid of struct io_buf_dma

 block/fops.c                 |  1 +
 drivers/dma-buf/dma-buf-io.c |  3 +++
 include/linux/dma-buf-io.h   | 22 ++++++++++++++++++++++
 include/linux/fs.h           |  6 ++++++
 io_uring/dma-buf.c           | 19 +++++--------------
 io_uring/dma-buf.h           | 24 ++++++++++++++----------
 6 files changed, 51 insertions(+), 24 deletions(-)

-- 
2.54.0

