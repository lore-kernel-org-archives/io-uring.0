Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0EE4E0216
	for <io-uring@vger.kernel.org>; Fri,  9 Oct 2026 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556271; cv=none; b=GmFodvWGmty20BgsuNIm1aG0B1U6O1gU+N1ZuOod5imzfFAuOH8pxoJ4RRvO9R5bWw4JZyi0YSiZDWt6aUlvVKqdgpBuX07ABK3EnjSgXGBl9hct1qyrNiHStwN2qcVIMceuTg0hOTUsjW7GUwaD7tTGg12fsn14R0dUkAbrHZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556271; c=relaxed/simple;
	bh=8HN9dpiTOxbNQy5jyHc9eD+FO3LGEXONxOXuTYwbqtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ppAYL/XMKxGPRZpLAgLGk377qWZSJ0mcAFD0nIXstz604LyMHGf4kOG+dnB/WwuZoqdJmgXe0Ft96Dkqrbx/nFU9QDrlrLCoqgoMbrsFxDtZ2H/emQCyt4fkPkTBM3SXWb9moWUlCwr4h8xUlza1X7N6oUJgRyaI9LYWq7FQR5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=iWLWNOYT; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="iWLWNOYT"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3515f9a5d25so3347364eec.0
        for <io-uring@vger.kernel.org>; Fri, 09 Oct 2026 07:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791556267; x=1792161067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nXbzjrHDowmjytwjBBFJiq8VXsAFcUvN5YKwmyv2rUs=;
        b=iWLWNOYTd8869GHPdyC3y5tgAwvgzYUBHgbMTF8c2NoWJ88Exw14Y/EdtI1t+Gc2T0
         BLD0lpy7YOHfqhR8qAymJS1OebzVOZis3ZUHJWGul1xXBg0Va1ESspfxzLO68M65i4jW
         gnonOt7KD3jrAq4PXuMfo4H1krdZbxneS3YKZIkIuIWBwDewq02Eadq+YCt0iq1ZjSuI
         38nfL0hu0TSV0MkekFslJwrDAbCG9n3t7vy2pSTsPy/WfuZibumEvDU3NzXoIqOgmTwk
         ayi43UiSfC/27mhRH+bPZrk1uchoaS/mAZIAf4lxG/chE8Sp+A7qtQ/ffHgOvzfSxj0J
         zFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556267; x=1792161067;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXbzjrHDowmjytwjBBFJiq8VXsAFcUvN5YKwmyv2rUs=;
        b=1Bo8RN5LOZW1lX83AUgnamZNXcILLFMajtkl510uK3udT0zm+gRDfWprSNElX853C+
         gsiYApsWNAOt7+fow1hwEg75uYMkx9lqRbjjk6DrlH74KpQ689woGEN/sim31ipLKAlP
         pYp5/VHLrMa1Zjp6+TPjcCO8u/LboLWbTZyVFjnHy2/VIEizO9mqgt6xgTR4rQDl5inY
         imrE9sDCFugbUeUM84w4RjyVpVQothZD21Lzy7tmVrZig0VQA/m/Vao4C2qNIc2Gm5Qu
         cPwqeqnEX1w3DEjtcCc0wzbFNgdPT32tbG9BnGBD44NPWnKt1Q7D/HqZN1EfZLgVIuw8
         TywA==
X-Forwarded-Encrypted: i=1; AKwUvBwf0SCBDDpOk2CHxIO14QH8aYl2MyQci7FdlUjsbTxQETTIIVivF1fNHVBhc6N5yXTHGQR3YhvBsA==@vger.kernel.org
X-Gm-Message-State: AFuF++nFzyt9g5ZeMnoOQEEfrtPayf8zWfpMav3KiiryveB5+XSYznbC
	uocAg5PdAUo4N9AAo60W3Ik2NEaPBCfq/WKgBIhjAyUPy6GlWHQZ+yCMqfa7YWIuBN0=
X-Gm-Gg: AYBFou2imu7rs+i0PE7tZU06QW7qVfAznnTyC91uYNZZvLVxTkV8yRqVAtmKjB3pHuX
	/2jqNXWUdxqKGqlHokVXMG9uYeqZSdgfa7Px2EGxiLcPrEKz9/tTYQ5+ImwiCzu/GtKR4WpDB2E
	4B7/E0Ca2cdmI47h/z4m4cGP8HfqOGZI5eARPSSKHC05oI68RsDTLP89Tix/7FW/Eh5HCZBz3VQ
	8xNnujThHQ9KFpQAhkgfUlfMuBg46DMB0PWUwRluKuaQ1rprRBISVAc7n+HEgbg5f1qX+e02EhY
	7d3ODadbNEgfes5JipbKniOU3srt0dL08UaYEY2ykl4px9o/dac2UgK699b25jiaTKsqxPuIusf
	l58qs913YLf+E2q8xUcQ6nHbFYULqW2/muGQBSdyAq/lZib5c5GxWi54ww5jBwXTl0QsG4JdFUm
	gvDuBE30fa6JShBYpVODl7+l3Y2kFCB2TipImSPTOgyQT8W0g3xVrXj0Y3sc+lxmRtXKuVBMlKt
	QQ2J+LvK1Q+jnp6Z2ZLo7gh3MbcTzmmTX4qU3gUkSQMrdXyJzuIpza1ZxsrZtI+FEU1pLHMd7Zd
X-Received: by 2002:a05:7300:8806:b0:34e:f5c3:96a with SMTP id 5a478bee46e88-3537e0a9a67mr3478504eec.39.1791556267141;
        Fri, 09 Oct 2026 07:31:07 -0700 (PDT)
Received: from [10.61.8.29] ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm6789499eec.18.2026.10.09.07.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 07:31:05 -0700 (PDT)
Message-ID: <9c0da57e-401b-4dc6-9bb0-76eeddff7c18@kernel.dk>
Date: Fri, 9 Oct 2026 08:31:04 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/register: don't exempt disabled rings from task
 restrictions
To: gvozdet@gmail.com, io-uring@vger.kernel.org
References: <20261009-iouring-task-restrict-fix-v1-1-a49daf55a12c@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261009-iouring-task-restrict-fix-v1-1-a49daf55a12c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/26 5:08 PM, Eugene Gvozdetsky via B4 Relay wrote:
> From: Eugene Gvozdetsky <gvozdet@gmail.com>
> 
> A ring created with IORING_SETUP_R_DISABLED is exempt from its register
> restrictions until it is enabled. This lets the creator register the
> restrictions and then enable the ring with IORING_REGISTER_ENABLE_RINGS,
> whether or not that opcode is in the allowed set.
> 
> Since commit ed82f35b926b ("io_uring: allow registration of per-task
> restrictions"), a ring also inherits restrictions from the task that
> creates it, and the same exemption applies to those. A task whose
> register opcodes are restricted can therefore create a disabled ring,
> issue any register opcode on it, and then enable it.
> 
> Mark rings whose restrictions were inherited from the task, and keep
> checking register opcodes for them while the ring is disabled. Enabling
> such a ring now requires IORING_REGISTER_ENABLE_RINGS to be in the
> task's allowed set. Per-ring restrictions registered on a disabled ring
> work as before.

I think you want something like the below on top, setting the
inheritance only when it's true. Going to fold that in, let me know if
you object

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 6feaf09bbe8e..c994157173a2 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -2957,13 +2957,13 @@ static void io_ctx_restriction_clone(struct io_ring_ctx *ctx,
 	struct io_restriction *dst = &ctx->restrictions;
 
 	io_restriction_clone(dst, src);
-	ctx->int_flags |= IO_RING_F_RESTRICT_INHERITED;
 	if (dst->bpf_filters)
 		WRITE_ONCE(ctx->bpf_filters, dst->bpf_filters->filters);
 	if (dst->op_registered)
 		ctx->int_flags |= IO_RING_F_OP_RESTRICTED;
 	if (dst->reg_registered)
-		ctx->int_flags |= IO_RING_F_REG_RESTRICTED;
+		ctx->int_flags |= IO_RING_F_REG_RESTRICTED |
+				  IO_RING_F_RESTRICT_INHERITED;
 }
 
 static __cold int io_uring_create(struct io_ctx_config *config)

-- 
Jens Axboe
