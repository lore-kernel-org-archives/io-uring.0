Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D155D39C62F
	for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 23:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788217274; cv=none; b=JXrMe2yI20lHh5RULIIdvfiZNO4HiQKYZedss60vLDdENVzz1Yzz65cEGr97E90F1REuTIkpVhrN3bToUdqW9QkubV0Ph1QkTe4oQPjFUPkd7EN1/8s6C2IhMxzAOkPLOr5gAoOiZ1IQvEtxSuxyYYlLHCsWffxTSPWxvjH+BPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788217274; c=relaxed/simple;
	bh=XGqjJPWEg0lro9kMC2Db84WJWULpdPrVWehJUMlcDBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M5pREuMinjGkMw2AELCRjt35aX/yY+Da75Lpkibg0nhLsomWbq2dmSrmLKfN8P09ysMCpEVzOIg2R/b8J1UUcSPNOOz5bFHGa6WYBqMrKo4UlkAFK5YVBZzfQVzPOUgCiNWxfWlxi8y4NwIm7YqLeQgfAoGWRo/8wkBNdD2+9A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=kb5imjVD; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="kb5imjVD"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f3ff92cf4aso4335122a34.1
        for <io-uring@vger.kernel.org>; Mon, 31 Aug 2026 16:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788217267; x=1788822067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pt3dfVQct1p/gKjGTZa313+5fHZtUX4qug2yn0+rds=;
        b=kb5imjVD8xO6fU+9xH9cF3gNZcMk+M2nD9j6KJ377D5Z/PDQEjQiqptgkfZ4KkF+t1
         xbOzRkVl9VucQCEI3fX3bZCCe7jMuWPszd/X+4BxTQnNITZIq02q6/dGUa0Vc7lMkbwr
         xCNyGAOu615O1FXdp2geK50Pehr5aABLhFVNSm2GB6BKKE3YyRtju1z0nZhxX/JSXB/r
         fXrylkMjXqNg5g7WQ45k3DFxkG5qr/+fIVsRUJGhBDndyBrb4ij3Snd8KpTJb4+Nmkjz
         VIXC71rNgpVCASL8MwYc2sJkkk+xaY1zt1Ao53GJUKbSn7ZgIrq8oGao7vnn9KmhvWcl
         7yPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788217267; x=1788822067;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5pt3dfVQct1p/gKjGTZa313+5fHZtUX4qug2yn0+rds=;
        b=HORqPTPQtzezm+GyaIP8V51mDdA7AJauKUMjpBGQ4UuKX8ZPUr/docwfP50dbf9gpE
         4Lpn4+JqTAdvgeAK6QoRz+is/0UOdf83jNEzVh7IT3kZIaOy+BWyv1s8WuUZLaTCLdCK
         YhzssoHPfTGKOCGU+yJ2DrzvNXXkesocnZDezlTw1FV/SMBu7n2CLdEYz+zubMs+AcuS
         643N9PAM4fv6cP5HfsrR/vqsP/XMXrAFcv/FttjiixAdQDmy3pKGBBQL+EzD3WFLcMKN
         XbZkBxo+jloV1nmk759CaImlMC3skszhcRgT6tz4JiJqPbDLwYNvTDajbb3RNhcr4h1z
         PoKg==
X-Gm-Message-State: AFuF++k5sq5rCu4+UbX9UJW3lrz0TYGVfDc8xILPQ0L0L+rRRV1BLT68
	HfZHbUdsg2d/lmvjsAzygB7YfzLAjYyUCr/bU+CD4Gx4GL4uF9/RR3v6Tpj2j1PpHOhWfG4F+ZG
	hi67FVfQ=
X-Gm-Gg: AR+sD11hA7cSXMtzskM+eaAd8s9Tm+2EVrY8wOXJwI3Swvl5aW7ks/8GfmJo/c//Hrf
	5EBRi3f71ejzE1bPKhZgBdT7pKtdT/YgQZVkNH6n1MsZryNwdRaiPIk0bjS270tir8OEjPf/LIM
	UhTxb3CzXvy2NbNBqo0mqhY2E7JpJv9K0WrfoYWOKZYZiwEFCH8o53F6+mwtvNhnOvYBXaF1IDd
	42bHuOGl60Y3D/EK9KyK4n3bGEnSROznLuS5Fcqi5Sme7VUsNo6WXzkZAXEuAJ6YjVMFF9Px59E
	IMizHws4D7qhZaQNjKEQoUlGxXfIWlukOjR3a6rkmNdMrn+/v2xVaseENxLgCxtqJyh2+O7rfbU
	BwjiqxV9+W715d80odC5dBBszKnm6jsrNTkIq6HDRjwlDS55D+3MNAIwNObQyQn5BzGCjdL+ur2
	LRW9zxcuveiJm6AMsP+hFHKC8Jtc3G/NuO4+0trN3ENtp86Ql4nSQgGcP7qA7On6AaUznoo7pjW
	QQz3sa4axx5
X-Received: by 2002:a05:6830:3105:b0:7e7:76f:3ec0 with SMTP id 46e09a7af769-7f687c09d4cmr4715259a34.15.1788217267126;
        Mon, 31 Aug 2026 16:01:07 -0700 (PDT)
Received: from [127.0.0.1] ([99.196.128.151])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa96ce3dsm9544682a34.18.2026.08.31.16.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:01:02 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: io-uring@vger.kernel.org
In-Reply-To: <20260831155222.121857-1-krisman@suse.de>
References: <20260831155222.121857-1-krisman@suse.de>
Subject: Re: (subset) [RESEND PATCH liburing 0/2] couple of fixes to tests
Message-Id: <178821725905.2314179.12747064297885998322.b4-ty@b4>
Date: Mon, 31 Aug 2026 17:00:59 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 31 Aug 2026 12:52:20 -0300, Gabriel Krisman Bertazi wrote:
> Two unrelated fixes that I sent a while ago.  Jiri Slaby reported iowait
> sporadic failures and while patch 1 doesn't fix all of them, it makes the test
> much more reliable.  Patch 2 is a trivial fix to CI builds.
> 
> 
> Gabriel Krisman Bertazi (2):
>   test/iowait.t: Skip if system is not quiesced for too long
>   test/iopoll: Fix clang CI build failure
> 
> [...]

Applied, thanks!

[1/2] test/iowait.t: Skip if system is not quiesced for too long
      commit: 4cf73437863c2e492d2a1d0f24330f391c0f075b

Best regards,
-- 
Jens Axboe



