Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116141;
	b=kiIeegT3O4qNmfO8sNpA5g5xGAHyKfU1f1PW4mrxe6wKdpvD+eZer4Fz5p3DIYmNHQ84
	 NbER9XE6lQJA6JlZPLUbMcGWWmxoSCeX33nqVw9FVmVdsZjYnc4eaIy+1gaA+gG4BJ9ZA
	 HcItR8V4RcO6hxDJr0uNgMrRnOhFm8cTPGOhbdw+6AFimjC3pWX1RNepLOJH531ynwExJ
	 ICt6bfvZs3sioHdGZi5SwAV0GkaeGz1DFouWM8EUZ15IVOLOFRs94R2VqwlqI7UqAFGRl
	 aMR1LdzRurMPyyOTzvoK6Vdpj/qMVHzCRQbqC8c+Ni4vIcz1BHMhfiCi7eXCPVGfi/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=cRzWg5qQKFmMuhyd4/4Z2il32eZUmVYgj/Hrx9PgLGI=;
	b=lJ99zezsKxoRMrO/BCxMWz+rnzF0hgO77kggoO6l/QtiqYIqitBqHigHWw0yc4F61ZC8
	 VlFXurl62HjYQ8aRgTx4iIvEFmfbIrVTy0yoC4XHDFLUZ77bOXmDtPFcnToQxMX4jYsBI
	 F5NdPiFHg7ysF6qNICw9LItJQWM+5GTk4U+gKvqeaJa8kJ3/C4Wlfplt/z362kfl2KRs6
	 Y6PBTECRPamPfwKNwmHchwbDsd+vqvc91nISHywF/wsgpDC76WxiYL9ISbf0+jxgySVNb
	 tPuU/So6pmhI1t/uR02Gm/OmZz174xqyMNkvht7aBKidWX2Q4b0DiaNuyzvddc4RPrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z9Aj5BOz;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9AC606A325
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 19:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC9AC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z9Aj5BOz
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ba01393800so258785e9.1
        for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 11:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116139; x=1795720939; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cRzWg5qQKFmMuhyd4/4Z2il32eZUmVYgj/Hrx9PgLGI=;
        b=Z9Aj5BOzUVtIE1msfT6kOAEY7elguyjaEkK9QsPeWqbXa+sdlSdMzHycMUxhk9HLCy
         lUUQOJWurrDDwFIKhhNlWhmAx8Nm9a+u99Q2raS3KWhXkBSBhce4htqHB8TX4doJoGWB
         BGK9roh7BdVdjRZWrwwoHn/qd1YwnnTaJK8mWsEUp1m+Dz8kD28mYbNiQq6rZNGkg0rF
         7/fz51YZ37yhLjHWLzhm+jeK9WYEHJ+XOpanXrs/nTNUiHpkWJb19Ww9a6kvwWl+dNC/
         gnMjyFzvTyicIHOW3QWyEGOmI7ZMpcsSPj/woUi0UDXe51C5PdZIQ36Rq1f40kgnKU5g
         VXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116139; x=1795720939;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRzWg5qQKFmMuhyd4/4Z2il32eZUmVYgj/Hrx9PgLGI=;
        b=pluss4ul6ho/9SbHY1YR5E1Lj9iWB3+Ta45c31apeNWnWp1whyFHb0ACacJHshcHTD
         +gor1Shdnj2ETvsc+buXPrW9Q0ESNu75Dnzucq0bTTs/XmlUnrHTz5uMFNiFO0PmPClV
         KPJf2TInoQA2oNEoftvI7B+EkAveOvlrP8CG+e1bhHWCVaxT/otuxukbsyNHy63DXAxR
         VewSrNVPLb7k2JfycO5qTA6spF3hQQydWRkkGkfle0Dgqhq9lF4BoYdW1aZSvtHSxQdq
         eyI7QYz+6uszS2xYw07eusUKl6KJ/SyYXfgyC84zQVSZp6UtYnJWCgnC2azOh31Tz3fG
         Ss4g==
X-Gm-Message-State: APuU4Z/ELOWPHr0pgG0cysVsHeihbcCSrxpQZC1Z+lXUoD4+G9DvhwXO
	UjvTVKjpmimCGWOgEcjzRGGp+ETU5wVLmuq0eUXP6oqHc2d15TU3V2VYuESm/qp0ip/wjLBucg=
	=
X-Received: from wmbd14.prod.google.com ([2002:a05:600c:58ce:b0:4b6:4096:72ad])
 (user=dmnk job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3547:b0:4a2:a6e:80f5
 with SMTP id 5b1f17b1804b1-4bb888098bfmr10770515e9.11.1795116138591; Thu, 19
 Nov 2026 11:22:18 -0800 (PST)
Date: Thu, 19 Nov 2026 20:22:13 +0100
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119192213.2653868-1-dmnk@google.com>
Subject: [PATCH] io_uring/msg_ring: enforce target ring fixed-file update restrictions
From: Dominik Maier <dmnk@google.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, dmnk+artist@google.com, 
	Dominik Maier <dmnk@google.com>
Content-Type: text/plain; charset="UTF-8"

When transferring a fixed file descriptor between rings via
IORING_OP_MSG_RING with IORING_MSG_SEND_FD, restrictions are currently
evaluated only on the sending ring. io_msg_send_fd() checks that
target_ctx does not have IORING_SETUP_R_DISABLED set, and then installs
src_file into target_ctx's fixed-file table via __io_fixed_fd_install()
without checking target_ctx's register restrictions.

If an application broker populates fixed-file slots on a ring, locks it
with IORING_REGISTER_RESTRICTIONS disallowing
IORING_REGISTER_FILES_UPDATE and IORING_REGISTER_FILES_UPDATE2, and
passes that ring to a sandboxed process that can still create a second
unrestricted ring, the process can use IORING_MSG_SEND_FD to install or
overwrite fixed-file slots in the restricted target ring.

After the smp_load_acquire(&target_ctx->flags) check in
io_msg_send_fd(), reject the operation with -EACCES if
target_ctx->restrictions.reg_registered is set and neither
IORING_REGISTER_FILES_UPDATE nor IORING_REGISTER_FILES_UPDATE2 is
permitted in target_ctx->restrictions.register_op. Checking the
immutable reg_registered field avoids racing with uring_lock-protected
updates to target_ctx->int_flags.

This issue was discovered with an AI-assisted code review tool (ARTIST)
and reproduced in QEMU/KVM on an unmodified v7.4-rc3 kernel without
kernel modifications or error injection; a standalone reproducer is
available upon maintainers' request. This fix was compile-tested with
-Werror and checked with checkpatch.pl --strict; an equivalent fix was
verified against the reproducer in QEMU/KVM.

Fixes: e6130eba8a84 ("io_uring: add support for passing fixed file descriptors")
Cc: stable@vger.kernel.org
Signed-off-by: Dominik Maier <dmnk@google.com>
---
 io_uring/msg_ring.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/io_uring/msg_ring.c b/io_uring/msg_ring.c
index 3067c93..caaf37c 100644
--- a/io_uring/msg_ring.c
+++ b/io_uring/msg_ring.c
@@ -267,6 +267,12 @@ static int io_msg_send_fd(struct io_kiocb *req, unsigned int issue_flags)
 	 */
 	if (smp_load_acquire(&target_ctx->flags) & IORING_SETUP_R_DISABLED)
 		return -EBADFD;
+	if (target_ctx->restrictions.reg_registered &&
+	    !test_bit(IORING_REGISTER_FILES_UPDATE,
+		      target_ctx->restrictions.register_op) &&
+	    !test_bit(IORING_REGISTER_FILES_UPDATE2,
+		      target_ctx->restrictions.register_op))
+		return -EACCES;
 	if (!msg->src_file) {
 		int ret = io_msg_grab_file(req, issue_flags);
 		if (unlikely(ret))
-- 
2.56.1.750.gf70dc682cf-goog

