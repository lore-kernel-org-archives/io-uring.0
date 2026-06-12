Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F5A1BF33
	for <io-uring@vger.kernel.org>; Fri, 12 Jun 2026 00:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781225959; cv=none; b=BVCQLJmpgwjDxgwzv/+Adti1XleD0i2qiiVkWp1CcGKqoI5a6JJhnSPAs6xKcWZLxgae9j59954goZZyJdOGmnePIKrbXQ4sdnLfoz2+3KN6fVNuMtaUVeQSLntOy4/jLvbr8zVDJ3TvsImr9hTGYKRkOipoi2g2zSZk9CwzEzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781225959; c=relaxed/simple;
	bh=wUlgFH9O0HnBw1nB2QE4k3GmazYKX/xceJ6lUm1W7OI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dXu6cecKwRMa7zwE++YDmHw8uUCGyAyEj39R+gHhGE9oSVOl/uxUEfLzQDx6RdOvE9ilrolXN8OHQlhlKB002B4KtiATm+K/S2UUBxOUYsnCSxas9nN+66mVXipQRWWqY9abjfexr6kMuh8N3G3kVtQ/PurxcQYbt8kG8rCDmkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WzztUrZi; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="WzztUrZi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=tY
	s4/JdNPf7Dhi4HJPJSLJK4HNoHaltyDCWi9HG5j78=; b=WzztUrZiQx68WoGd8I
	ybfFdstJDpxvrNjyO9NDBOf91SWRvbloJWW8i9eCobPk6tgVikbfcnKqjBfykC7+
	sGqdTG/4qsyH2pt2T2FFQWOjETuvsvDlVf+d55Jv07t2klmtk1aT0yaRRTXuISNc
	9ApxVaLmMkBc2Pfh2mmZJ1yLE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wB3H83WWStqrVhfCg--.65S2;
	Fri, 12 Jun 2026 08:59:05 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org
Subject: Re: [PATCH 1/2] io_uring/rw: fix link failure on successful pipe short reads
Date: Fri, 12 Jun 2026 08:59:02 +0800
Message-Id: <20260612005902.1369063-1-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <d75fe34f-dc14-455c-8d80-04d341a9744d@kernel.dk>
References: <20260611012236.3020181-1-yangxiuwei@kylinos.cn> <20260611012236.3020181-2-yangxiuwei@kylinos.cn> <d75fe34f-dc14-455c-8d80-04d341a9744d@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3H83WWStqrVhfCg--.65S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFW8Jr15uFWrKF1DKFy3Arb_yoWxKFbEvF
	15tan7Cw1ktF13A3W7Kr4Fq3yqqF4Uur1ruw1kKr4ay3y8tF4kWrsIv34Y9Fn0qan3uF15
	ursYqrWDtr1avjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRE7PEPUUUUU==
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbCwhrxgmorWdqtJgAA3i

On Thu, Jun 11, 2026 at 12:36:22PM -0600, Jens Axboe wrote:
> Not sure I follow - the "short read/write is an IOSQE_IO_LINK failure"
> is widely documented. So not sure I agree with this approach.

Thank you for the feedback.

Looking at the history, the IOSQE_IO_LINK short-read behaviour was
documented in 94163513 (Feb 2020), while 9a173346bd9e (Jan 2021) later 
changed __io_read() so that non-regular files no longer retry on short reads.
That issue-path change post-dates the documentation, 
and I am not sure the two were ever reconciled.

Is the documentation still the intended rule for pipes as well? If so, I
will drop this patch and treat the current completion behaviour as
correct.

Thanks,
Yang Xiuwei

