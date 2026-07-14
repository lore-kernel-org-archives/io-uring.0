Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E67C24113D
	for <io-uring@vger.kernel.org>; Tue, 14 Jul 2026 14:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038477; cv=none; b=QTGJxRGLYwdrUHF1lVax7993gJYx9UuMuNs9w9oAl+l/dUEoIBSrVpoBqalNscKefICo7JJFWhkuQgao60EBrpOPrz6pLy+VFjXQ0QrZLJ3Hx1zbC1dqMwThTGzkV+RckzTVlTEBSO0ug0ZaEFZK3fpib4nK4mQDdgckQLfw5Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038477; c=relaxed/simple;
	bh=IcNQu62tYB2gtTE7APHonuzdyHBjYlcgqlBQ6wpkVP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qttBollm4okg7/eJSED86wL7j91gjXETG61YaFes4kvkibA1F/FbJL1+Gzl8TbxitHutBUpi7BIwaYRuRMPAbNSjgGqta6GbZIHlQzWAuhuDErCpgmBxicbL/0NihPMFJ8Hev4y5+7FWM3/RWq6uSJ3iCA1W7HmeBquclnbqjaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=fWSMnOCY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="fWSMnOCY"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso9000655e9.3
        for <io-uring@vger.kernel.org>; Tue, 14 Jul 2026 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1784038475; x=1784643275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IcNQu62tYB2gtTE7APHonuzdyHBjYlcgqlBQ6wpkVP4=;
        b=fWSMnOCY+sJdErz2SzmO0FPaKLR6O9y5mcPeJBdz+S8VFkPXb95F1XxgoXHUdy1qHD
         N3wHFly6f0pyMfBLt0XnykZbEsv87mzUFY/IpLwYDVxleNtDdhMvVf2k0wvgEYKqv0Z5
         qqFhGw0fh1uv4EHh1J56EPByc+wzAn+g/mu57/3H0MaehxGNCUKbQddoZHIkgGeiRMsr
         68GYvTZi3HkfYn6FrIoxzhlhyiBCq2po8hrAGHKyxwsofSjtdYQxPOdwHFyPYVdSrpjC
         /PNrmS3mc7leWIYIT8UX7cbxdMoTl2XxMKs/7BI3IuBteDrLVcV4wtsV1VqsmbYBeVuC
         iECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784038475; x=1784643275;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IcNQu62tYB2gtTE7APHonuzdyHBjYlcgqlBQ6wpkVP4=;
        b=S8qZVJVHY5vhn7+HNFfSAtr8y/WfPg6ud9jY4fq/t/AfEnuD3Zc/p8S2l2DedC7HMl
         gK/r0/8jc/cTaAixfjC6EV0qRyVTAJhuzrzC6fE994DaR95KnkS8382pUX++OSEmYC4/
         84kbePRArxhcQkAXwYe5wJHXh3+97ZA/ZAZyTxM99yXXGSckMHS8PVk+6HC6jnGtePJz
         GG3LlVhccQDkwOO79b0fuoBIvbrMrkfZUpxEF9edbFqbh/ThsS/lqTxw38tOyiUyeJwM
         BWU3i9fXwRrmoC6iu8uIO2T1/BGxLE343dOoQsPpWgWVZG6I0q93btZgUiUiJhDb4d/5
         t+2g==
X-Forwarded-Encrypted: i=1; AHgh+RrhTdyxnkAX07/2bKib0+qtxMtplp2LqphQsa6qWEK9zRcmrh5md7Ri1gD61hzbVujXwFirA2vhgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMu2O0PbNGk3ksiKRTY3HLyuWln7FOihHBnIjqoxkf0ctoGxKO
	gUnGdU6fDlgLwbMNXGTs2VcnG7mS3ccP1MVCiqVWdlg9+2JHm3+OioOJpruT/9oKuzrH
X-Gm-Gg: AfdE7ck528u7GgAw2h+SKNicMgwH3tI578Kh41cuHnLkcivuFWoaX0MEMR7QYueerFu
	j9BRcWM2K8Oa2IISmdtydShBBRoRan/SWPdMCLIffq/0tabjyr6f9nBJpfn0QbBGsbGQsmCEE6E
	X8c35XmIe3yvcgXWOiXiwbCKU1Jq39stDAfjZMgOU+ph+HVl9XAjd/WTGUhBCwnGNU4S6veuLvV
	ffKPEW7AmloaTi1NrIbhC/YqzmAEhCg0n+JN1w8/P5jjr/Hs72aAZzMgPcqHFmmji3UuYXcVrHD
	tjE7c8zWiX973zdx58Ywg+amAxipgvIMC60Q9GblpQ37gZoir973bxNXCiIMjiqH+0igcmgtCbZ
	CkeZ4RzFgV7h7XsKwCF2F/poI9/fpkmGgwJz5gQsRjZQkZSwkepTQzPTT+jizXAE7VWno0KcZKl
	extTWUW8Db7v4N0zMDUjG9nz5iZGlWZrvDT1D2I4qLmreZ3ARQmBL8cMnIo39Fgd3sothQcOqKM
	a2rHBFNlqGNolRcSXZ7cfclGMgJR+LqIgM=
X-Received: by 2002:a05:600c:3e0d:b0:493:f0f5:f2d7 with SMTP id 5b1f17b1804b1-493f87d6118mr145913835e9.7.1784038474345;
        Tue, 14 Jul 2026 07:14:34 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a322bcbsm87403255e9.9.2026.07.14.07.14.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 07:14:33 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: krisman@suse.de
Cc: axboe@kernel.dk,
	io-uring@vger.kernel.org
Subject: Re: [PATCH] io_uring/kbuf: free the old cached iovec, not the returned one, on bundle grow
Date: Tue, 14 Jul 2026 16:14:32 +0200
Message-ID: <20260714141432.71345-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Aren't LLMs fun?

Ha — they are indeed. Beat me to it by a day. Please drop mine.

Best,
Doruk
