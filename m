Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089619;
	b=RMjHeCUOVsx3u1skwLTdP/An7MasNJ9b8FiU+U4wmsIVYkwSFO6hrC/RopIlgvfUolU2
	 zJ0XIybcdPIQOKqXOw9ivMJnSJAx13FYpsh+BL8IFwhWUaugSFdV8RQhnth7kLc9rSddd
	 LJbhhTVK4KYTiVzIKuDRQhpTn4/pzBVPmVPrqPx2sTDJlx6KUtl10fPy+9wzVJza1Xlt8
	 9QvuRd34ZC0eh5xEVIJcRY9UVErEvv26j5+Sq1EqPBT+GIaRzCDxPuK4ByDpGPBToE9kY
	 ZwK2oDtpO8WG75gxiM4XO1IH5B7zK5agb1557DTDw11YO02PAQuvB5RfAlJTYie1FVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9gIVlXgPEmkZGmA453gdpvq+MACAnZz6AjvCWRUAbDQ=;
	b=B9d5A4l/glI0indjMwouRvha+95VXPUoe++BC84ndmugSUQvW4TGQbTqLPzc8roZbkMI
	 fjbw3vwxBVu718EEpP4aikVQUeDnW4s+fftZXjofKZpdC9yY65u/IOsHE/lyi6u1SvFqE
	 GwOOzy4uikqK/lzWpy2YUTM7l3JaBniZelTFQ3fiTWLj/ZnEyGYEElLQXsfT7VZmGlZGC
	 RY6/meFpOjoJhSL+Q0fh8/SibQCZayINLzu+3dakBbIvCEz/Hc9J18H0lXhfD0cNlbxgU
	 4tECOoJy6+SuUnI+QhlFLNPtQxM4kgFl3LTMLtCiu1X4dAqPVlEZZJYh9N37NAX+9Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MTPwBz/J";
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5A6606A324
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 12:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D5A6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MTPwBz/J
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so1350290b3a.1
        for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 04:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089618; x=1795694418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9gIVlXgPEmkZGmA453gdpvq+MACAnZz6AjvCWRUAbDQ=;
        b=MTPwBz/JY27HN3sgRWUZI0tlkBcWXxf7M7RAXN68cgdg1Am8p7kKnqmSmbk9i3paIX
         nxuGPCiyFzKnbLXHTcpkZL9Jl05xOmooAxQ4ClctRHIr5+ntBgvY4iRhOPPxeMYmnypY
         1SPlY1JPWNh72h0Le+gSG7pxiVUY6/xphqQkwjAhgBiRQ9xfq4MSEwQT4mtoTarBFDIM
         pA2OfASffwaYexAEuos0xfq9yHeB+zfhsnIZivL5ud55stPCuYqdAMDCI4dK5GuB2BAI
         rsecijok4RzXP6n9QVIouU2C2dsMFACTuLaYblKxFjsHNOIT7edbPt+7lOVID009Ys9C
         aFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089618; x=1795694418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9gIVlXgPEmkZGmA453gdpvq+MACAnZz6AjvCWRUAbDQ=;
        b=XZoPOUxI1tb9k4Vf4s0grgcCQZN/qk/IV/kgVP5rrr+UkZF+EjE1VxGQQeHHx7c3Aj
         6i4L3jOw1sv+A0Z4+QzOVN3YEGq36hVrG1l0fCyLa6MuWlqWKD9VHkpbNhkRDfsFpoti
         46WMiHM2YI0Xz6n2vi1f6MWt5BzokMh+DUOFlfW7MjBO2cCyJyKQg9ZcU3t1acopWsO7
         gkHZQ7ThHFhLtWKfxff63hVNg4jkPB0NEGK9EOnRe9MYQcDAvELGvhoDJjOPaPv4thvy
         41sBwpTlv3KZPeza86VmwVy8wtUHPdCZ/WtOMlLoPrgBVutye/WG7GBti3aaP9MZncCc
         DSQg==
X-Gm-Message-State: APuU4Z9G0MP88uy3cFM7o5IuFg+HB42XlcYoQZgk6kvSEd4vZN/LcsDJ
	WfALg70yljo2qnkDupuDz+J33C2Lcs3osV6UcJFDSoXui44sYcYfZtIi
X-Gm-Gg: AYBFou3Poa4suuEh5Zt06KKDxshHjOWAPncOGjXTTPJIYWu0I4PhsqCQGKVaaTwSPbr
	L7hEFtP688ZmcTxyEWYDo+4xOr5cpkwVChP75UnF3J+MBhN/f2OXmi8ii+DbViJi/ZEIElqejiH
	1hAwHOcG7btSOIW0CIlwsBhT7JK1mbflvL8O1Zx46g7Evk4G4OUEvMg6iuDczB7q6N129FMLHTt
	emVLBCfxDzHRfjXPsZCRkEucYFvcwN8FHHdBZsWvyk6vrQjLYNxBXzhw7j38+7p5u5M8LQjmyNF
	DvrGb7CnTVpVRpdUSBziFzYr6/LFrL9tTf+Ap3ZYS6k8aul8PLDV58cqNqkxFTTD4tap16boDdI
	x4BuMOZfaJhWeBw/p3UGHx0CIL3ibF3mB3OTvzE93g0OT1y/75zgFAcfZ+HX1z4ztOVNiQWLB97
	grN0XIUENFDBnu9Osu7ZeghEkyyVSo2ljdiMzo6nj1pi15tEc7zzpm+ZkDGsQhLyR3Iryo5eitf
	a/FSjd7rV5ZJdBGoN4Usk2SQxSsYwI+7G9tlbYrIwVymvj3DiAFZgFfCyrn7rC3p+sxRrTMbdmU
	K3yOhMy0iaZYmIg/eEdJQLihnOi7yXXd33XgyNA7nN6KHNQWuJEqw4KlzGWdhedO
X-Received: by 2002:a05:6a00:2d86:b0:878:3538:8f7a with SMTP id d2e1a72fcca58-8c5d51a37ccmr4621024b3a.40.1795089617602;
        Thu, 19 Nov 2026 04:00:17 -0800 (PST)
Received: from cps-manycore-1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb93d04bsm2665088b3a.49.2026.11.19.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:00:17 -0800 (PST)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: asml.silence@gmail.com,
	axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/bpf-ops: validate loop_step before registration
Date: Thu, 19 Nov 2026 11:59:29 +0000
Message-ID: <20261119115942.3613868-1-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.56.1
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

A struct_ops map with only ring_fd set leaves loop_step NULL. The
struct_ops update path skips a zero program fd, and bpf_ring_ops does
not validate the completed value. Without BPF_F_LINK, the update then
calls bpf_io_reg(), where io_install_bpf() triggers a kernel warning
before returning -EINVAL. With BPF_F_LINK, the warning occurs when the
link is created.

Validate loop_step before either registration path. Reject an incomplete
value with -EINVAL so malformed userspace input cannot trigger the
warning.

Fixes: 98f37634b12b ("io_uring/bpf-ops: implement bpf ops registration")
Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
 io_uring/bpf-ops.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/io_uring/bpf-ops.c b/io_uring/bpf-ops.c
index 6c2a587fb1bf..dfa93144b090 100644
--- a/io_uring/bpf-ops.c
+++ b/io_uring/bpf-ops.c
@@ -157,6 +157,13 @@ static int bpf_io_check_member(const struct btf_type *t,
 	return 0;
 }
 
+static int bpf_io_validate(void *kdata)
+{
+	const struct io_uring_bpf_ops *ops = kdata;
+
+	return ops->loop_step ? 0 : -EINVAL;
+}
+
 static int bpf_io_init_member(const struct btf_type *t,
 			       const struct btf_member *member,
 			       void *kdata, const void *udata)
@@ -269,6 +276,7 @@ static struct bpf_struct_ops bpf_ring_ops = {
 	.check_member = bpf_io_check_member,
 	.init_member = bpf_io_init_member,
 	.init = bpf_io_init,
+	.validate = bpf_io_validate,
 	.cfi_stubs = &io_bpf_ops_stubs,
 	.name = "io_uring_bpf_ops",
 	.owner = THIS_MODULE,
-- 
2.43.0

