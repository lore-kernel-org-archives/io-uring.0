Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA5A3431F8
	for <io-uring@vger.kernel.org>; Fri,  9 Oct 2026 14:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556431; cv=none; b=Jg0+gqgY0rfhRj+J+JhfmRwK9dVhWzZoHwYDKAHtkGAXtSc5sBL0r0PhjcHLDsgrU5CH9T/ZZODwv3OzMjlyMiQMdWH1OhBy4jHml09bCEvixMTG//O97DYDnmpE+93jJLy9ZYiqL6uPcLyeX5X8rHqbFopJFA8Wm0Xsgj5n0d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556431; c=relaxed/simple;
	bh=xv6zzbRXfWNmHN3kY9ySRTd8niMhVJ+PZQRMETxvjvQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lvu6+j07cZpRHvGVF1+uUHuujHjUH57xTL9t31G0PKipOkh+QVvfHbtv33a44la1q3N4s4raqAv8U8WG0Fl8gcDRGSbk5yq/W/wkNSKNV4wa4pLTLUhob8kSoaWwzywmoDQ3AhUGsnyTJoyVPVefQh2wIaJknv9lHP5mONthbOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=MxvDta6J; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="MxvDta6J"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-351767ef18cso3528085eec.1
        for <io-uring@vger.kernel.org>; Fri, 09 Oct 2026 07:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791556429; x=1792161229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GzAOi+95u4YgETIpz8cOgOaDACFlaO5G9IG8/tN+Sec=;
        b=MxvDta6JyZthODVU2DTgsdtEcL5J0yg6i3zBSPToGTf8rvilZOlffAlF9MEcK+MssX
         GPq7nhc7NPlinUsulGetb0IIi8671RGSDJDi6qzPyzGgHnHt5uJ/raB/AtnHsPMEeG20
         uwZ/fslLZ4FRlsJMwbX58PFKpyRmZPsa6b8eSMx8emUATt5/SiwgdMewCVqmFrAroewH
         7LJ3cP8EktLYUtSMrNDEUEY8mENU5E3D+1wW8MtGj1XjmcLhxLH9UceCL8c7g8Mpqse1
         d5z+9w4EiVtD2t2facH8aFPNA+M3me9CSm7Ph7W4rjV46/jrUSLnY3zqgBWAXQ/6Cxuu
         WwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556429; x=1792161229;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GzAOi+95u4YgETIpz8cOgOaDACFlaO5G9IG8/tN+Sec=;
        b=v0f5MQcfiMjv4E1NakVHItHl/syo5bca8C3UO2eiUJmblCsLlOBzv3NQD1ivbdlRqH
         vW8JIu0qnaOaZFQFlHgv0JoevSjpc2vFgkmSN8wOFJU7sdvC/+2Tw9ckZ4uz9BhV05jc
         spNN8U2RqgDiEWtjAO+cpcG2UuIYKXE7Sz8i819eGcBN8azjVP0To/OslUksAMwgipJ2
         1nLz9BydsU+suCH2+wH8zh+cKgt11RJc7K1pMHGXvwCOA/GZ1ptFnhivSwWu2llYmqYb
         pBBJbvr7iDAUS7N86guGRNPEt5GdYFu7Z/sRA+HzSr83rSthddOyh6SWJua/PWIWd0U3
         Llng==
X-Forwarded-Encrypted: i=1; AKwUvBxxo0+ynK3CMSdc/oS1uFA5dquKZMkvIUzj28FackmX0agR6Zt9TXEeamesGCQnPwG/RGRMN5lhdA==@vger.kernel.org
X-Gm-Message-State: AFuF++mFb6xLu2+y0kd1FX/o5MGp2eXE/pdLHSOCno7thSpjB0mWbm2Y
	PU2XriUek1QrINfZwN/MVjM07mh75k7LWzEHzoaD0UtEe58iowsbD6DwWhYwdCdBQWI=
X-Gm-Gg: AYBFou2UBMo+vWCluGymYt7XlYkHwPN9GnW0qdPQFaS0cQzMzG4dwMVSYfiKhpofJyi
	guqPvnx2hLm5dJvBI5UCMCH5XxxiFDvLKi/1vH2iBVCaFCf5nFEIplbl+ZRpLgRADmL5tnizZpp
	7bUaCZggf5t47WZkUU9+rnw0l6ri24dhHEhGanoqQtQ7s059b3RbiCrmI2ccbmH9J0ikq2YRRBj
	vVrc1qWN+ZOUlvpj3v1pfKABXmUTi/CSMjIb52+axRiXPfixKwU4N5c70i9RMoHjgOqXTS2w0+f
	ViCrvdRa1fNi/GlVu8+DK2wSSbjEmZjRHiHxOi3gEeEAxO3Egj/mFwNBWG5K/3VXuZ/5NGnFUDv
	u2qwKdUAfCsrJlvcS1JSIb3LCBFfxS1dqLL5d7yLwZw3gyvUH7hjAYHdcJ7yD3UEWDofhy6wVYX
	EcMsqvzonZI8spU2HkwFMpT08SGNEyYFykm4y3PQDLiGGQesC3FJ9cpSNFxYAtK/xujzeyLsSGC
	TWSjqV8ISdJZ5gQJg/T95VS9cDXsWGkNMShisEXUJVrx6/mtTqep5Wb77p87X7TEuntvCavA9c=
X-Received: by 2002:a05:693c:26c7:b0:351:73cf:80d2 with SMTP id 5a478bee46e88-3537df8b001mr2961994eec.11.1791556428814;
        Fri, 09 Oct 2026 07:33:48 -0700 (PDT)
Received: from xps16.local ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e05esm8003444eec.25.2026.10.09.07.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:33:47 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: "Cen Zhang (Microsoft)" <cenzhang@linux.microsoft.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 AutonomousCodeSecurity@microsoft.com, tgopinath@linux.microsoft.com, 
 kys@microsoft.com
In-Reply-To: <20261008191602.45101-1-cenzhang@linux.microsoft.com>
References: <20261008191602.45101-1-cenzhang@linux.microsoft.com>
Subject: Re: [PATCH] io_uring/cancel: don't spin on local work the task
 can't run
Message-Id: <179155642662.219229.2527920169574410888.b4-ty@b4>
Date: Fri, 09 Oct 2026 08:33:46 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 08 Oct 2026 15:16:02 -0400, Cen Zhang (Microsoft) wrote:
> io_uring_cancel_generic() refuses to sleep while any ring on the exiting
> task's tctx has local work pending. It assumes the task is that ring's
> submitter and that the next io_uring_try_cancel_requests() pass will run
> the work. This does not hold for a ring that was still
> IORING_SETUP_R_DISABLED when the task got its tctx node from
> io_uring_create() or io_ringfd_register(). The submitter is set later by
> IORING_REGISTER_ENABLE_RINGS, possibly from another task, and only the
> submitter may run local work on an IORING_SETUP_DEFER_TASKRUN ring. To
> the exiting task the work stays pending forever, the loop never reaches
> schedule(), and the task trips the WARN_ON_ONCE() once and then spins in
> do_exit().
> 
> [...]

Applied, thanks!

[1/1] io_uring/cancel: don't spin on local work the task can't run
      commit: fddcf4c5321b3ea5f72166c3fd36a9d1c34f80c7

Best regards,
-- 
Jens Axboe



