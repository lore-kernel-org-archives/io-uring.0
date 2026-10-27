Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793133954;
	b=0SshbBkfVpDPGrIPPyNr4L+K1SdsWf5M9uAH7+N4ZjD5axwdksu047goa95OJLZfYRtx
	 tVU+4nlTxxuCmUmNRluY8jL39ydAXXpv259dair/s+j+oVzXXEcIWEINMD/Xlief2QWvs
	 IeMipbEggm72sWWLtHIl9/Iws6ktRzblc/RYv6udbrKs+lnDAVtEe+fbMuv9bwGkw3MhS
	 KF6StEZaFNxOzEtqvZ0Y8yfZ7Cdc3rVbrI/GCR6vYoCAFF/Xhccj/vxgGQrRU5Ohg4maq
	 dyO/XbuOL1l35HK/AsKt5PcKQXE3JPJB3tQkED+3+H6QEMVhpt+QVBb0s1Cz7EFmesA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793133954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Qh00ezH7qk6YhQbSVUDAycO8TgQqa9yC0VmKndI+OZI=;
	b=a6Di78S+CCEiGvUV0R2PdHwkMRsL1Sh0b35/K4MueVK6+CIohPq7QTbld6xLVFzQgR8f
	 az8bX5rjETEDhT69eEDyPzeZSfLtDZtCPXCWL/8Uuj+q/nM+d6KlfZxHPmMkD5X9ut0t/
	 lKIj+5Ud+KA/Tn2Pvt9V7BVbmPDWV2I0gxBd6iHQ+gMwZzr6PDW75tSjdyJkvq7FnJEHK
	 63/+W3PRB+uBWh/3HGz8pOo4mEfJ7yANYRQFI9B7uUtSvorccLVfckIRKh6I13JkIPLxs
	 /j0L1POGW7Xapq1rraumJemcMT1Otuh2JpbHJjDrOliiG9jMIzKMYWBhZKhlCVu+9hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEf2kU1f;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E19606A31E
	for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 20:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72E19606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEf2kU1f
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so2699945e9.2
        for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 13:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793133953; x=1793738753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qh00ezH7qk6YhQbSVUDAycO8TgQqa9yC0VmKndI+OZI=;
        b=eEf2kU1ftB795WE7MnbSaTyOCX7NTKGkzk4h64H7eSvOmMJXzCI2DdmJ2DjnsY508U
         lJ9/wLvptGD/dpw9vCh85p8FGWCJwCpCrXy3awW4eI2qRIjHtx7197U2ecMUBNBjZzUb
         c6qE311jpqJ62nqWBS+tRzX6FrHTpCjsFfZfqEIu2slfW9hE6i+WNXYnOOjv93czWgMt
         dfDwdgq4UCDdpmcfQbfv7Mkh+W5hQi6+uDAmIkuLsw5Mm8tnDoANYkKy0tq/qDSEwO+q
         Z8CIb7ji2aLTYgaU65FYpzh7dnmS7/8YvlkuGjI2UXErC3yb/rx84TPR4wyQft0JmOPa
         kimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793133953; x=1793738753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qh00ezH7qk6YhQbSVUDAycO8TgQqa9yC0VmKndI+OZI=;
        b=okeNEYJ4xRWRxhGFMCVuzYTxuyG2+WQFFUS0qi5+rjvqVcFtABWIgb50SGdmB3SSEC
         7n7ui0c+4oDT6VLP2ShdyuXVKGxJWD1x94ypNlPRx1kGRV4+VUWJATbNnbQ29JZY+IFS
         URg/jMcXCV/Hg3DFJheXrNBUWbPCT7iphtFj0Gv5PcFJZxcZ3LD223iA00Dqd2MWrX5y
         eUpWIFcWvRMXS/U47QWBCr0NonuYvi2ZgsoG/5zEENWVfqxtjwI9OW3AilpunEXXTY82
         QQQ8KieOSBS0N4PszOgaMUFVL8inaIT/XEcYtpN3G/3mqaHhHeWT9DcDJFR3oKkucnCq
         fFyQ==
X-Gm-Message-State: AFq9FYIUk0vJ40zUsJ/9DRKZeX+2o/Obwy9ZFTebJZlDmsm1nAmliSNC
	daF06Qy5F04Y/rduKzh6vmnuUsXR1RsJI+hvaGrUxN16pn/wlBxIClz+
X-Gm-Gg: AYBFou0ahpUJrOOCvm7XVL6+/KsxpZVJVQWMANgPBjWj5tHS/AH6YNURhiw/dpLjPlz
	AGpSTB9bmtNDvZSGqWu5+FW/kgizKRkklOlLZT4gAuxKGXtaZxvf9eT3GZW3E7Ca1hiHvq3IIWR
	vSO636xXryxPXTnanm+pKg9uZtNkPGqviuz3dsXJzDe2KuYEB2CL6P6T5D0F2fksMmSzZKw7Z3k
	IgNL0/8VgCfXBFIfrLtSYBpAkDl+65Rn8kJA7BgzDGLNhUUXR0c5vb/xhf5C3p4PbRJPks6Py12
	b3wvEGUEf3mCwRTazPcdD9JDSK0xqwGdvjeVKJaljUHmiYqwrBr5bVqfvILtLEz5zsACNsE277S
	J+aAyP+kz97g+2RUNSwTRmYowITElEOG6k8T1fLJ9uOe0ccvUgHKbUTkNaB7dj+LMsGqtQDPvjx
	1pmiU8gVIzlfGhes0HDIj5A4oMH/ClYZWbdULNoklarHbnnhYrvyJNDkegL83DpUkeeA0oKcBms
	mByOEUd9okl7xUu++WOME1PJLLujjuaodJE9B8riv/u+4w8Xw1uzeB9WtbpfMvenGoquG5bFxVN
	MtSO6n9QclNwmKyflvPjsO5rOf8ECrgGrz1LJoBW2m5T/N7SU1pooyWAjUmpJqiTixaebvaFH6f
	+JJKVJ2PmDAI/hqesenrCcnRnAHIEZdWRFoFZVFyUUyLQxIKlPvViqvHB
X-Received: by 2002:a05:600c:6208:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a9643d51b5mr2268405e9.2.1793133952638;
        Tue, 27 Oct 2026 13:45:52 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b2ac-9b01-21dd-e5b3-2a30-2e97.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:21dd:e5b3:2a30:2e97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm24338968f8f.39.2026.10.27.13.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:45:51 -0700 (PDT)
Date: Tue, 27 Oct 2026 21:45:50 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] io_uring: final close can hang on a stopped
 submitter
Message-ID: <auENFo-ONkpSYcNq@gmail.com>
References: <20261027043521.99446-1-kmehltretter@gmail.com>
 <b50196b6-cc04-4d3e-965a-28c4f75ef263@kernel.dk>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b50196b6-cc04-4d3e-965a-28c4f75ef263@kernel.dk>

On Tue, Oct 27, 2026 at 12:04:59PM +0100, Jens Axboe wrote:
> >   3. A unmaps the ring but keeps its fd. B drops its fd and mappings,
> >      then stops itself with SIGSTOP.
> >   4. After confirming that B is stopped, controller P tells A to close
> >      the final ring fd.
> >   5. P resumes B after two seconds so the test can finish.
> > 
> > B keeps both pipe ends open and remains alive until close returns. This
> > excludes pipe HUP and process exit as completion sources.
> 
> This is working as intended. With the change, close() waits for
> requests still in flight, as otherwise they keep files pinned after
> the ring is gone. If you SIGSTOP a task, then that task can't run
> the required work to complete it. A fatal signal will still kill
> it.
> 
> Unsurprisingly, sending SIGSTOP to something may prevent it from
> doing work...
> 

Good point. This is not a real regression.

Thanks,
Karl
