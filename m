Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D012A47DFBE
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092745; cv=none; b=guR5NkkMj1hnAnvtuSvqu/1weidrrTIywVqTZLqFgqVLuYtC4lZGPhwhwl680eULn0k+fCI8R/V+NpPna79ygEKkq7S2pxMYT9ZOaq5IWG0q0GwAgDjwuhaY+d4O+RAoHAJPeEwuuFK8V7rdPw+cMBTmBqaPxIfW/3GQo7uLS2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092745; c=relaxed/simple;
	bh=pBmbndxiF839ZDehtu6hTxiSeg0+o0p26A94xrdFqLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VOomBnQHjCc77AyNWNqmV9DmLR+b7JPy1EZrtlSKBzsNp7wThGcopiZiH62Ln6AJ+nZxEEhwoj7vrEyiznnBcB3FrlU+UXZ0CQcAISEOXuNBR2/1MJauL9mVPMQszeEo0eUBbVZMxATOM6yi07WU/GBgNrIC7LfmyWQgDSj9IY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=ERy2cvJp; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="ERy2cvJp"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53512cd2f85so70675041cf.1
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092743; x=1792697543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OzsN/fVs3fKgJ+5vP+9pHObhjnuYbdNFX1XAOE3Wn3U=;
        b=ERy2cvJpbOdC7tNiAapVeRikX3nZzJVoY76wx9w6ninWq8myE2ElSma6Dj9mjR9MkI
         lVanEY3Vv3IWW9h4FsD3zf7vlXA+kewga0CXqhQEUoTcdVE5aSfirUbU3Y9Eu5wt/NCs
         MC/3Sn9NxxmfINNvDFH5iVPJ7q2B3DtX1Px4JQCuQEqg6VXLlY43llHm4LAhNz3UWLwH
         D3vMsCO/vlXvJFUUDsUnWOAWGbA4q/zXZuxF0GFj8f4ljm4+2gRX4MWYpmfug2sukrBD
         MYMZIey8cyxdRdTwWG0LYugQR6N85qswnWS96YkQJzWRaN3JGQQ5tvS+HSe+1khPkCTH
         bk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092743; x=1792697543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OzsN/fVs3fKgJ+5vP+9pHObhjnuYbdNFX1XAOE3Wn3U=;
        b=26zz7l47HGgbXezsV9QjrgWjxJ1lruqe88ihh2RyoKcPl/9bZSmdHbtnezxzkudZ+g
         UOIYlZ1pKLDHAZ9i67+ezKQTzGxF10ILAD62jJYM2sAEShju1/9wuPoUkH/fuxYDT07b
         Elus7ayWzp8I+8qIpEmqAZ1mefB0w01r4A8LlxugzgRFGHBz6wJBCw1oLcx90lXSDW0I
         T8/Uuo/oniYghu/VMSv3weZdpCZ7Sg1WtvfDG28f5m6oFoIm3azzU4iyfD6u/QgGbJwI
         TvhLWxS9SgEXWhp/XfRhz/VDhpl8hkkoaigeakSW6APJvlpsoauINcfWfG7B57OBA/1A
         CENA==
X-Gm-Message-State: AFq9FYJa+s8lD2C/sI7O9eSn0eKGJlHyDMR5qgterf8uzkn3mooVre6B
	fuHTwZK4hJC1yPq7HW9YndZxQEz6dDvsgjSqg/tQc1l1RQxSrirIKEiowBU6COg0uGp7xe0JP/1
	vkZga
X-Gm-Gg: AYBFou2+EYj9mlWfu14+GZp3NS9T1Qcg9J6yJsLK/tIP84xxUvhQJjZmZHPhCNma/54
	cWKksgSowp38Hkz100AugzLzaR1EufLbXKEHGFOpFarYNc7M29YEIrnjrf2BxtfgDv+suBaIA8Z
	DYn9JvM04T1r+gxrsEwAcPj0EtYdJLJWZW7zU4PeK4XUVIDUXbnTOOdxw5h2FvWo7Z2sSXbTBpl
	LLbQL5dtJrKxXmeDFzVBDq7rv7+og1Q/2whafiORJ+BZZzXlUu3tooDrLLo+pfKoh6p2/I1jMU0
	lRGtNdMCmsE39T8QsT2uC/+iOsnskotcEzKw09dJEX5kusms0JNn2HJyC8x+bbLi9T17RgMHlsa
	u9YRdagrbZZ4ySRZyX95do5a0+61k9vHjrMTHl2rMf1pIAXXMNHffzftqV8azgm2GREheXJ4deJ
	GiDl5dQL2U8FC6R+eggQA8FxQIZKiITCnMB0aOG2SHbVC9Jntt3IudeLKbNL1vyMjnzWRAglHkJ
	0I5qaQYW5VKcIM=
X-Received: by 2002:ac8:5d93:0:b0:535:1f5c:e489 with SMTP id d75a77b69052e-5359f499337mr361058251cf.5.1792092742603;
        Thu, 15 Oct 2026 12:32:22 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.253])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a946b42sm1500541cf.12.2026.10.15.12.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:21 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:31:00 +0000
Subject: [PATCH 36/43] io_uring/kbuf: handle index wrap in last buffer
 check
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-36-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092659; l=1256;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=pBmbndxiF839ZDehtu6hTxiSeg0+o0p26A94xrdFqLI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMnR3m+ihL4jOPmVDS3pZIhOlnq6NvkuAZrdgRE51s5QGz/ZHEVeicETOw+FkdvrJcVG1f3Zg9b
 X30KMa+Xq/gw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

io_ring_buffer_select() flags the request with REQ_F_BL_EMPTY if it takes
the last buffer of the ring. Head and tail are 16-bit counters, but
"head + 1" is computed as an int. If head is 65535 and tail has wrapped
to 0, that compares 65536 to 0 and the flag isn't set.

A bundle receive relies on the flag to tell that there is no point in
trying to get more data. Without it, it goes for another round, finds no
buffer, and the request, which has received data, is marked as failed on
account of the -ENOBUFS. That severs a link, and ends a multishot.

Fixes: c3f9109dbc9e ("io_uring/kbuf: flag request if buffer pool is empty after buffer pick")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/kbuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index 6e2facf34bfa..c9641b6ccc8f 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -204,7 +204,7 @@ static struct io_br_sel io_ring_buffer_select(struct io_kiocb *req, size_t *len,
 	if (unlikely(tail == head))
 		return sel;
 
-	if (head + 1 == tail)
+	if ((__u16)(head + 1) == tail)
 		req->flags |= REQ_F_BL_EMPTY;
 
 	buf = io_ring_head_to_buf(br, head, bl->mask);

-- 
2.55.0

