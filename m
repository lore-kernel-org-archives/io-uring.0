Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20656361965
	for <io-uring@vger.kernel.org>; Fri, 25 Sep 2026 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354355; cv=none; b=dCA5ftpqyayuvowE2hIv/1QonNW00Thqk6G/+msLDBvIOonxgTFEQwqNR9gbb0t5DfIhpNzxrNHZWf0SRLwJ44vTjiOxsilepPGmLFl4bq7Uo6WzJAN2CpYkxsQ+8uH/+n+Fo4HO5PCmd5XkdAh+T/pBIWKrKlnf+XlQKcywsyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354355; c=relaxed/simple;
	bh=KlAi8xHnnOFw/mAVUfZ1GHm5kwwuI+phYGNF3RKELvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jci61dxnMTZvR3VUJhrPZ/y1hb+FnojlRYkjRqGwfgOGZmdzurI35O8Bo9rr7+Q69sOQgMQlGS4DvHet3hDOJXZPeH/ANe3tBoY1imA3hGaMKgBsmYOL+P8UXWXVrTw69VD/sv2SpXidnEM6IVF4pPOXHRWQYDbe0+MP2tfNxWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qnp/unAj; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qnp/unAj"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93be29bb454so169007785a.1
        for <io-uring@vger.kernel.org>; Fri, 25 Sep 2026 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790354338; x=1790959138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ST+t+OHyPOxhwcwtwjmxYDqoKgl4pMnoZVmAn6Uok8M=;
        b=qnp/unAjOISefdNdI1rFz5ZDX34aECjUkvwBKpt1kLiRwas/ABAZ2RHuYK0vhYKgN2
         HaiicVjRHoa5IsQiVWdwozEXSjPLwFrunQ9zLl/Yf6VpPXCDq94Mc6bYKak3DbcErpwN
         7OzzDik8onwuvtj022NEZHZuYnXUcnvpEHBGReC+w7M2Ft7edhNvT/AnVVhzR070z9Y/
         4tBtPbAYgWMZQOi0O2johw1GHFNSBCSls0ye/0c7MIFGERCUWM53ttmW/lfytkyb/TLZ
         5HKH9lEDEo8MFT/O57FQivcZFCy8h4DcH8RliHdrzNLNqSBJHC5D5kkG1h+uJIY4ixdG
         JZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790354338; x=1790959138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ST+t+OHyPOxhwcwtwjmxYDqoKgl4pMnoZVmAn6Uok8M=;
        b=Dcs062YK1D3DPwrZ0J5PkiDMf/2bcBFwWzBI/Ngzu9vcDl+ZFj2fXI2EsAjJMvi71T
         /MwYBQwEJ481qlHCd68jpRxrQDMfTIhRMuhEyKRjd5lFB0lD0iz44CqgxmBwYnqj2qNJ
         ks9T9BNwpLsX3PzjQKtSHSXWtgRFcfnhF0kf/FtzlJ5InvIfgXKql+EUUjxs9IJvx2NM
         lizsudoS3++PSNOplE3uQdOwm76XEyh8OrUIzRs85m2OdhrhyNcVYMfaIfNhbGrXncyk
         SlWL+XvWN2SFm6QGFpFH+kwu7lGtIEvKTOT65du1pfPUQ3IMT2zbUboSdA5smWs1W3ZP
         /+Nw==
X-Gm-Message-State: AFuF++lS28z2fNH+Dw/Ngt8gn4tRFpvjl8cF1t2MBiNbnQ54YCKhU/eI
	0ecmyssHSgyzhoXcaI3EU/dpq/61MpqU6Hg5WNjOHn9nkY+jWLawX03n
X-Gm-Gg: AYBFou3NaGc0LzWCyFjIc9nrLhbNRYaeHowIQvGp+HZ/zQwOvbStR55n9WcnZZHeIlz
	MT+QQIO1dyc6z8RQfBe7aM5KiKed8taXFBAkB5qI6IjQwc0bXHc5a568QivCLYia4/FFiOL2Fl0
	Tut7lOQIDcRWPEKl4zQ9cvatLZ0gjEgvJj4r4WH7bOdQL3jVOqiLODXPUVaGG97CG+9EYBZO0V5
	nXy9zG7UAXWNm2aHqWUFn3aSiW6LA0W4039H12+7pHbuwq3DEelU3iCmRmfoh8wuAKtqLrngVLs
	pXRhpWfsK0ax3Ykfsi0v6XdyWvJmoRZ+ljAMm//Kq2rXGxKfItdTGU/GGzNOXm08SAqEQphWBFz
	Fp0HZ5WnCyzhlVZEYRjBf3g6qcsM9e8tvBByTl1t7zvxk9DiBpycpuLF5ImAydwxqy/VV3Z3Fh4
	Bpl1jtdPtzow+cye/t70Hk8uyMqMNKaWTzj6K61Cg72eyro/gccVImvMLfNEEwptB8gbVk72t40
	1NYcSaRLUd/FMIech4v4rH36Im52JR1p1Aq/4AvzukUqhLYlfMK4QWjKA==
X-Received: by 2002:a05:620a:3711:b0:93b:e578:5838 with SMTP id af79cd13be357-93c43b86652mr598453885a.12.1790354336954;
        Fri, 25 Sep 2026 09:38:56 -0700 (PDT)
Received: from kernel-dev.. ([2a01:4ff:f0:3ff2::1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430dabed8sm20923566d6.12.2026.09.25.09.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:38:56 -0700 (PDT)
From: Uzair Beg <uzairbeg11@gmail.com>
To: krisman@suse.de
Cc: io-uring@vger.kernel.org,
	axboe@kernel.dk,
	asml.silence@gmail.com,
	lin2530632123@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] io_uring/rsrc: allocate io_rsrc_node from a dedicated kmem_cache
Date: Fri, 25 Sep 2026 16:36:07 +0000
Message-ID: <20260925163607.524636-1-uzairbeg11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87jyom1ju2.fsf@mailhost.krisman.be>
References: <87jyom1ju2.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gabriel Krisman Bertazi <krisman@suse.de> writes:

> Not opposed to having a slab, but I actually think it is
> unnecessary.  see patch 2.  If we do that, we actually should delete the
> async_size parameter in the opdef, since it is now redundant.  But
> see comments in patch 2.

Sorry for the slow reply, and thanks for the review. I couldn't find
your comments on 2/3, either in my inbox or on lore, so I may have
missed them. Could you resend?

For context, 1/3 and 2/3 were both neutral on their own and exist only
to support 3/3. If 3/3 changes shape as discussed in that thread, I
expect to drop both.

> FWIW, this is exactly why we have the (*free) callback, you should have a function
> for your specific type used as a callback that does the kmem_cache_free
> so you don't need the if/else here.
>
> But for a simple kmem_cache_free, kfree works just fine.

Agreed on both. I was guarding against a mismatch that kfree() already
handles for kmem_cache objects, so the free paths did not need touching.
