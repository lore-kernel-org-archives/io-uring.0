Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586891;
	b=NNSGQxlGZepO27LbD5ydyU6UA1siDwYl9U/yOhbfS3rwoO3/F8hd1V3bL0QZimM700R/
	 Hx7nbq/K1tA2d8NOa0QjGTYU8zfTSY6Yzg+rGy8RJYGL2OlyE806K/FAPcE9yVsImFNGS
	 RVfAV9lsdrExid0Z6pFPkFXil1VLHak492v4dcLXjWf2Rf2XNCYNv6udQFzj5gsy2kIsN
	 cfXsYyYHivfhnYkGT0KDBLrkDmMo8Oyg5WtknHBKUGqQ+lMdrx2fLWhW4ld72MKnF32o+
	 zZi2ptXnAgxqTwKy5pYhUqDldGcbxgIR9YRDKExUo1Q3bhKm4KMcpgfCibP6J3oE/qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JLImEMh2jmdTGmR3AppLWOEEmaJkCk/wux66wL5OuA8=;
	b=0X8MpLy+rjYmg6ck/uHRh9AgRkioI47VJtUlBpuW31qCz2ATpYJEpkFUM0zhBg6qVi4V
	 l9Th4QJv9lm3XcuTdW3s0OuBbGGLU/Ah/q6C3I91+KKE/ZNUG68zHEBUTYE6D872p1ufr
	 IsSoA7kJFZ6P4XTayYSpCjIs5sasbag6oV4Nt72Zv+P3LIJtDynvIz0PIsgp0RfG38091
	 chDmq47UnFiXX67h7gr3AIy5ZkXZu3EKMGL03LuhW5NjPdxVz2EXvc9uCwBnS369Z6Bb1
	 KG+SUA1FAQlL3PKsOkwDvLZzocG5x6iydiGqKcL0tPMtEGN9Ap/qrMTVsOdsnww+fXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TWzLynu6;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276C7606A320
	for <io-uring@vger.kernel.org>; Wed, 21 Oct 2026 12:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 276C7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TWzLynu6
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0f59a5fdaso5639767b3.3
        for <io-uring@vger.kernel.org>; Wed, 21 Oct 2026 05:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586890; x=1793191690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JLImEMh2jmdTGmR3AppLWOEEmaJkCk/wux66wL5OuA8=;
        b=TWzLynu6MErm73XYM/fyyYTkuBYizVmnQTQ1/4Eg/N+/eEfmudKGYVVzdou76HCti0
         4SjydKA/3KabhH0uUdjh0i2pFwewrla1n9iWv5OunRcU3F/O0dIMD57IqRIqFBfk0pqR
         v8Oy8G6v93SOKKfPYlOsuBEOgvbjAZhvEqVjrM/Oseral/eoEOR+1U0ufPhePTI3fw2G
         ufAOpEuH0FOdNQQfmk35wQvRQMrup8StMaQKEMxNG3qAq8RSJqdA1R9IEhduCAMUL89/
         0g6PDGdI5RYNH5yqPxvw0xKYtU3RdDSyL4v/h9EZ1MmQjw+Xx2+zKQJDtWsm2VepHohD
         yQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586890; x=1793191690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JLImEMh2jmdTGmR3AppLWOEEmaJkCk/wux66wL5OuA8=;
        b=yxdjFDwryheBALTFOjclonKszU/0nNZPkGPZJBM2NRTzhWV9wnucBI/OxruGbJo97v
         lXbWnhfSTHunkjxgEdPCu/+Dpn5e+hw0PHHiB1sYFFUT5KcZQElUlbw4GFYo7K9gU42I
         56P8d1cHqNO8kv9OaOCrVJYnGxiuw1B/52csr2nqfiC35UPETnO5oP58YV1RaKnFX2ng
         taWLNNWkF3JWP9pYuuMTk4kET2l1Uk/3dwWQ/RTu+vX5kn9cCrHMSV+y+CpVWGnXhYwq
         tXi9j6Xu+kMPmAZCIHeUUuveF4TQmTpqE/SGYhikqhxqK+Kbw3H1ET0+GZDAUEMpyeEu
         qwOg==
X-Gm-Message-State: AFq9FYI+22ZXSVsCYU0N9fQXQTRysZD7tVDGNcHqmXrhlQgHxHa++oB7
	rJlRx9dWG4Cu4KsnX/UOW9zMlxO2KO/2yQHist668GzGxahVIEeOdJr+
X-Gm-Gg: AYBFou1KHTk7JyEKl1QGm7BPWvHvxJ8Pigi5WreVp1dsxCoCyFejuAeLeflCKek0AR+
	wNgPd/dbq3YzVV9B5Ra7NRdvfsCYIvEq3z+FHM8ZoPr8piHCULjDwJzQXImAfbkU/G+t8AH9Zl4
	IFeogn/5kTM70EB5211F/wvW4Ru0M1HnfZW+x+WBDMgd/eGQsBduXcOoaTv802WTh9JnA85X6ss
	8yuMeyIRu93WgSUj+uBc/Ap4OA0obac+xwhJBfbnuq38ayhDK5mBHVaMqr+vKpWNAWTqlMJmDBC
	OA4fsOe+9x4X0VJCVTf4mboh6NStLpaR/i3fNFs8Dw5Mey9xdP0t39BkgaXJClR+NCFkCWR460I
	OypIPWdCzVdKh87m9TZ2ynikxj+PPPcux6HkL7848R9qVTFj3HiN9sn9nIgWEunoa+dXB4GFNqi
	TrAn8rjYzx68LbgRvh/fUcYYTTcLaPlsfFM4QCIz+wG28X5IbbJaqDNC7eW+ZLSR52XCB+0k5m6
	kwiWeEkNJAbsJiiSFQvRsLAZj4ZirqmIZqX1v8A9cYJpOTPJN0E3Q==
X-Received: by 2002:a05:690c:f83:b0:8a5:b046:e00 with SMTP id 00721157ae682-8b133d190damr9916487b3.27.1792586890066;
        Wed, 21 Oct 2026 05:48:10 -0700 (PDT)
Received: from debian.lan ([172.245.89.240])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1300e85a3sm10089387b3.25.2026.10.21.05.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:48:09 -0700 (PDT)
From: Maks Ivanov <mi9992828@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: Re: Question about asynchronous blk-mq tag waiting for io_uring
Date: Wed, 21 Oct 2026 15:46:50 +0300
Message-ID: <20261021124651.17398-1-mi9992828@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <956e10db-bcc1-4e6d-a0ce-b5f5fe25354e@kernel.dk>
References: <956e10db-bcc1-4e6d-a0ce-b5f5fe25354e@kernel.dk>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you for the detailed answers. I'll continue investigating this proble=
m.=0D
=0D
--=0D
Maks Ivanov=0D
