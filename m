Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9A74E50C0
	for <io-uring@vger.kernel.org>; Fri, 25 Sep 2026 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354374; cv=none; b=C5r82XHSN+Mc8QEGMGlGnYdYiyWVbXf/Jy9YdMeI6rVBkv9hy4BR5eG6TmSGzfU6YFuURz7clKd68m7/8vG+eGjJ/dvUgATMWZyudJz0nvTHyWZnU4PzGhctZixeOVvyTmiVHwyIm7Z8Sli5mchs3kzoyts2lJR5caPUb/dUyxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354374; c=relaxed/simple;
	bh=piiNMhDZqsXj6hX5HCGLusCJOyYSSVJ4zi5UC2seskg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CsZ+F70w/TrcQFqtIdC9BmaPuJrTZIIta5BOVlC/NSoy3UeDPB2dH6yF/kxn1t05IiTiACI2qtOQTtBlYOvRggiwEPO/C7W4AfhtV6TGdTR670IhOxHFa3mTCrN4iHwq0UoClU1Nz0QxBgFl+JADN9GXc1Bk04aXE5u4C8Idk/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxpXMw23; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxpXMw23"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530c602630bso13645111cf.3
        for <io-uring@vger.kernel.org>; Fri, 25 Sep 2026 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790354365; x=1790959165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXkCvwWsAa2E+Hn6icM7sU9ne8b/y7FRO5EIaNV7g30=;
        b=fxpXMw23ux7b9WzZ14zuyJVH3TeEIi10sTN2gESPER9P+9v8p5g9gZVJBOBiogIaqp
         BUJWQDA9g3INmPV3tiwLsAN+/LY1YHI+s+rzHmA0liD3iLw2aZfl77gkucEI40dTwRRz
         4SiPddPDhsiZMmtW1jcHtobVxrCvCtMc9Cxcrr/Es+YeFoozdJTMvnvFtT/aMc365rHk
         f3o9z8PdcBR71VrsPImb2bVmLxyM+xaYXUHCPdCfoswUQHMArskSLzlMDIxCLxniYOfb
         5xNtKnihPn0oNLM7PCu17eqcyEOH1Y94us4IbC1y5u0VVHsdsljbYs5ORfyZ31aw6bTz
         kYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790354365; x=1790959165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mXkCvwWsAa2E+Hn6icM7sU9ne8b/y7FRO5EIaNV7g30=;
        b=cwrDv83c4cBGEgmGG2SyO1CjdCU1Tp0AU7dW5C4Ek7fiVnJVX5hoTMCOU7ufM/It4C
         DHkogTDFElN+wgdccYORNpaVjzLhWr24lzQkZjELJ+Bi3YWt6JAkf1RWxBM7i8QezFWU
         52VHIgqqmoAUKhZpR8JUnK7wPXqaY5SqqYUxY9uoVneLuUiNqfZEP4pH/q635+yL8D3o
         bq3irg7PBcW7KPv9f5j3D/jBdwvZrQcRyaiD0HvAMwASdRLnS8rf7SjPmp4rsHQPl46R
         SMWMfIYHZo3Xt3fsXzy74Kdxg9JkrxixJzH+EJNZFnD7ANM7OIF2aebDR6N6+avS5S60
         6wSg==
X-Gm-Message-State: AFuF++ml4Qp68A+0wXGnS16Lp4gyjtq9gJGrT/DveaPogJtcn9FbW5Ob
	ODdmsVOdG8wVQMoKcbRsEyhuRi6N2Ovhx9syfhenGtAq1F6ExtiSkL1F
X-Gm-Gg: AYBFou1TWp6nQEb0k9t6KoEWyYsFCw7zs7MlWd0SVW29oJP2U/D9RmPSkPVAeROsSvp
	GNpRhjnsIB+eBlUE2eQDmJRYH0LrcXhQmyodzvFH4aK7RNwVPCHDTeLZORGF5M7pGQZbqwWuv4n
	RQNCP/AfSKmlXgvUIfOpRty5WBex63io7JdkNdLSIrzQgpaT3F6aXanqJ5xhd04gv2WxYBUZZZL
	R5jp1QRZzOhjFyA2Gk31RnuXhxN8iSzubIM/OQaLt0wmd+DX+PIGzrO2h6M4fwNIl3pnl3Byyud
	0fYZWUH2qBtDOhWx44CZrRV6p5iFLg3CbN/6MVZfVRSDp/SXtC5ysDVTVLb1oPN1joG8Vpw6u0t
	5JfFL+MnKgUXYr/6bmFZhIHpe1LI9B7kluOR5lj1pzj4OuZCkKP6lvi6eLmfwSTm1xZ7f7C4/9h
	Mp76ugG2hRqUThuPpchCEe6iqfLALgpM3mn3LC2SJX8aT5cW0APiRNvJRHbs69AxfJN20BgEuew
	A9gtKvaF5Ojci8fLGObdvhf/Vyv5tYFpOfh9klyPYb/akNTUuxWWXertg==
X-Received: by 2002:a05:620a:660a:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-93c43d7571fmr552568185a.64.1790354364663;
        Fri, 25 Sep 2026 09:39:24 -0700 (PDT)
Received: from kernel-dev.. ([2a01:4ff:f0:3ff2::1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c5222f371sm81163085a.33.2026.09.25.09.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:39:24 -0700 (PDT)
From: Uzair Beg <uzairbeg11@gmail.com>
To: krisman@suse.de
Cc: io-uring@vger.kernel.org,
	axboe@kernel.dk,
	asml.silence@gmail.com,
	lin2530632123@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] io_uring/rsrc: prefill the node cache when a file table is registered empty
Date: Fri, 25 Sep 2026 16:39:16 +0000
Message-ID: <20260925163916.524653-1-uzairbeg11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87fqza1imr.fsf@mailhost.krisman.be>
References: <87fqza1imr.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gabriel Krisman Bertazi <krisman@suse.de> writes:

> I'm unconvinced this is the right approach.  This is only relevant for
> initialization overhead: once the ring is in operation, the overhead is
> gone because nodes are recycled.

For the first fill I agree. The part I would push back on is the
recycling. The node cache holds 128 entries, so an application that
removes and reinstalls more than 128 files keeps allocating past that
point. In the remove and refill test from the cover letter (4096 files
on one ring, FILES_UPDATE with -1 followed by SEND_FD) the unpatched
kernel allocated 3968 new nodes per cycle. As far as I can tell the
18.8% there comes from the larger cache keeping those nodes rather
than from the prefill itself, since the prefill runs once at
registration, outside the timed cycles.

> So this will really benefit
> short-lived applications that create large tables, something that I
> suspect is rare outside of artificial benchmarks.

That is fair. The reported workload is a microbenchmark, and I don't
have a real application to point to that fills a large sparse table
once and exits.

> On the other hand,
> people are creating sparse but arbitrarily large tables.  Does it make
> sense to pre-allocated up to 192KB in memory for short-lived
> applications that might use only a couple of those nodes?

As a default, I don't think it does. Would it be acceptable to drop the
prefill and only let the node cache capacity follow the table size,
capped? Nothing would be allocated up front beyond the pointer array,
so registering a large table and using a few slots costs almost
nothing, and nodes are only retained up to what the application
actually had installed. That gives up the first fill result but keeps
the churn case, and it needs neither the dedicated slab nor the bulk
refill.

I'll measure that variant and follow up with numbers before posting
anything. If you would rather the node cache stay at a fixed size,
that is useful to know too.
