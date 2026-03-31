Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E170139BFEB
	for <io-uring@vger.kernel.org>; Tue, 31 Mar 2026 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774964218; cv=none; b=kHO6OC7Voifu/Nk8Smgy8DfUrLcF4h8cplwSuVTM2u4OztHydTO12cfLrbbbBS3kLx4vE8ko/KpoZIORoJxm4+NCQufIVnAI5n/d9vUSmTOcwX+oWSm976alXPbt/ob6glVT0SJcBmJOgmEScIMpZp6xrx96PgHqOE/jbNuGjf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774964218; c=relaxed/simple;
	bh=HggOGHy8vbrSAiG87TTOXfOTBFyfdneQgTHOzFWRh0I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qD4qsnQ98It+psWOot/WXo8SGK3MU9dCbgyRvtou0ZC++8LlpjQCa43HCnDEEOCmpw3gz86WB4DdneTJdn+KGMCp8+5AMw7QY8R6SB/m80L8PMSCu/zscrZqhEI83QmWVy5k7w2+D32pr8f9Wfuep/rsQBQoKzIoQRoEkwl+fNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=NlhrlOiF; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="NlhrlOiF"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d75ed779bfso5721285a34.2
        for <io-uring@vger.kernel.org>; Tue, 31 Mar 2026 06:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1774964214; x=1775569014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9r5LFbVKeTdtbjPLWfYrEtB2xQ8EpM2Np/IFVbuqBs=;
        b=NlhrlOiFfYeult2z5lW6rpHfJd2nTdydxRY1AVq1careJY6ypazz/FhPz0ziDtf7Ui
         vMFOmy9kBMY/Ghz2O+SCc/0t6uqiHINhzWlTwI7Ct24whHwp+aFpst4a+/ZqtNGRSMqT
         08Xzbe1/Qjg7h+8VZOHuY/jtEu8ArKUVEk9JuP9T/GK177huw3q8HtjuyPPw9mjGAsKg
         SbwiWnkyFjTvWWdAM/McXeJIBJdqwb7WimdScXHNm50I1W+R+3KjIERtgMgFktjoWZfb
         MsJ+TzBd+6Szx5P8Tw2MvKoTzfz/h//iuTjZvTrRdV8yGGlpQJGzc6Vri3PjTLYcFj5m
         yW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774964214; x=1775569014;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9r5LFbVKeTdtbjPLWfYrEtB2xQ8EpM2Np/IFVbuqBs=;
        b=fGRMpNmw/ofoNdy1Rsrwa9Fnk8lJ8fHoyKoxMi+7EKFUhNeW2ofkwQbIGGOhwhm/+f
         8QCcDWUlfFU7KjNZOpks463VMeykVoD2kLxjP6H+JKsgN/r+Qm/cyqJd+gJAWjC7lv7Y
         tz489iqJ93DcsyL7iBRuDdLObmdwy3mTpy0BpVSgKr55rGtF0JzFc+4QWo8/0pBsXq/f
         RKwKZc+bPyj3Ibn9m/r23Zom4gPpgo8aW3/bk1LREEt9zJ+auT5/uwzdoiwdqACDzAPU
         uGjPQRAuTruOtq8zpJmBYLxw2HEdKjyx//5cqFQ1gCk+/Xj0FOlNgI1B/H+IKvzC5qnO
         hdvw==
X-Gm-Message-State: AOJu0YxFf5+RVzBjN33M0fhbwi/GFHXjsDseAXWpjO22jo7IdKoiQ/gn
	Mp24270D8ufmD/gyY74zTeU010sAKiXWoauydxT3dd+xpmdiLEvm12FeERgu4mdHlGF4mS7uG0U
	MHW7X
X-Gm-Gg: ATEYQzy/7mFot4UhoytXUCwhRk+mbNOU37cviPSGntgbWuphWHAFRO5KFE8SjllTMA6
	g+/TzWcg8ngGsHn/P7GNu1PFEPcXER/pvXGbgRRfR68AYZVtcswmLlFSlqnhxP6+inlYprUB6QX
	F5GPXA5PO5Hnehhf7ZTrP0EU52WTEhpowzrrJCqmF9Qi9cmVhO2+NKE6yi7gXQPACFsllQxRjcr
	7fYcTybEzPh9Bg3J6C53muebI1XFGYsitxisdPutoWL/o4wegSNk5+QIB8mc+oE+F2h+r3uUHoi
	WLYHxQHhF+eeOdMRxVbkB62fj8/7e8+9WaUZLSpbdfXi9JLT9hEVocVMtTAZhudLsVDpRYEIUUb
	RNFSIcHiExH1xF9HLPSKzFq/cV4VPgBQ7tpJLmQUKBb7LfV3SOFGlQa+8ylsyhq6aAosWJOI7of
	oximTU9AgIKbGzWS4VyQizxTvZkWab5pBTRmwN3AIVkQT8EvBpC8TbTEU9JFexba0qP6gVCf/6R
	5nn
X-Received: by 2002:a05:6830:6f90:b0:7d9:f50f:96cc with SMTP id 46e09a7af769-7d9fad9a5e0mr9503266a34.2.1774964214137;
        Tue, 31 Mar 2026 06:36:54 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a3b2e37sm8399049a34.10.2026.03.31.06.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 06:36:53 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Jackie Liu <liu.yun@linux.dev>
Cc: io-uring@vger.kernel.org
In-Reply-To: <20260331104509.7055-1-liu.yun@linux.dev>
References: <20260331104509.7055-1-liu.yun@linux.dev>
Subject: Re: [PATCH] io_uring/rsrc: use io_cache_free() to free node
 allocated by io_rsrc_node_alloc()
Message-Id: <177496421345.818652.10504384412211561222.b4-ty@b4>
Date: Tue, 31 Mar 2026 07:36:53 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1


On Tue, 31 Mar 2026 18:45:09 +0800, Jackie Liu wrote:
> Replace kfree(node) with io_cache_free() in io_buffer_register_bvec()
> to match all other error paths that free nodes allocated via
> io_rsrc_node_alloc(). The node is allocated through io_cache_alloc()
> internally, so it should be returned to the cache via io_cache_free()
> for proper object reuse.
> 
> 
> [...]

Applied, thanks!

[1/1] io_uring/rsrc: use io_cache_free() to free node allocated by io_rsrc_node_alloc()
      commit: 37912f1ea4ee2d8a4f36033fea4f44a044dd1cb9

Best regards,
-- 
Jens Axboe



