Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACCF399004
	for <io-uring@vger.kernel.org>; Fri, 12 Jun 2026 06:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781245823; cv=none; b=Gyls5IxIZzbIepaM1Fcj7Vk35E7Vb6bIMJHo3VolgG+nORhmu/cR8LhEYYSu1OQJPv/hwKGHUC2ZIUd6bH9Dg5l1CpU2F2nQdHTVqin9Kp7OAag4D/4bXl4ugQIKKnweFwTW/Va3Pc6nY8aSNIoGnHN/7LExH7hMaITIhHAEVlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781245823; c=relaxed/simple;
	bh=WVrtwcSuRzYCvKOWX+X6qmHWjyskeK6f68NE24q0XJc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tlg1p2nB54xDAoe/rERAgGrMb2hkUIHFoSUcvpexRtgbFXHJEALw4wxQ1OcnZlSc/+Zl1lmqEIqbGLi3rH0ElAIjrgpopQZHboJZrK995Gh0sxfuo96Zf/5EioTvfTCZ0kE4D0mvozCY67AJntllJJTrX8Z2XjZlnSU8KrHCMDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bc5jLU7f; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bc5jLU7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=WV
	rtwcSuRzYCvKOWX+X6qmHWjyskeK6f68NE24q0XJc=; b=bc5jLU7flzA2EdCtqa
	ikgkhi206/9PJR444zKwlmJ3nZxrBLyvExb+UahnrH4EjvyRRkAPxwDwCU2Ghh+z
	6T+coDX8pnpkwYDJfTbx3Bn/MX8Bd3uhYhDeU5hsJxb9oiGcTzZ/bdg8ncyS9iQ/
	WyUeRx3wWT80SKMOaOYIRue9A=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgB3Mv9ZpytqyaGQBg--.31250S2;
	Fri, 12 Jun 2026 14:29:46 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org
Subject: Re: [PATCH 1/2] io_uring/rw: fix link failure on successful pipe short reads
Date: Fri, 12 Jun 2026 14:29:44 +0800
Message-Id: <20260612062944.1968425-1-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260612005902.1369063-1-yangxiuwei@kylinos.cn>
References: <20260611012236.3020181-1-yangxiuwei@kylinos.cn> <20260611012236.3020181-2-yangxiuwei@kylinos.cn> <d75fe34f-dc14-455c-8d80-04d341a9744d@kernel.dk> <20260612005902.1369063-1-yangxiuwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgB3Mv9ZpytqyaGQBg--.31250S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurW8Gw4fAF48Ww1UKw47CFg_yoWfZFcEgr
	yvkwn7Gw4ayF9xJw43CF40vrZxur429r18u348WrWxG3yrJFyfWws0vasxXryxGa1kAF17
	KrZagr17KryI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRE7PEPUUUUU==
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbC6Rpl9Worp1pYXwAA3Y

Hi Jens,

Following up on my note below.

Patch 1/2 was motivated by __io_read() returning short reads on pipes
and sockets without retrying, while __io_complete_rw_common() still
failed the link chain. I had not fully understood IOSQE_IO_LINK at the
time. When a chain depends on reading a full buffer from a pipe or
socket, a short read means that dependency is not met and the chain
should fail. IOSQE_IO_HARDLINK is the right option when later requests
must still run despite a short read. Sorry for the confusion. I will
drop patch 1/2.

Regarding patch 2/2: the current code does not handle TIMEOUT_REMOVE
against pending link timeouts on ltimeout_list, while
IORING_LINK_TIMEOUT_UPDATE already has a separate path for them. Was
leaving ltimeout_list out of the remove/cancel path intentional, or
simply an oversight? If the current behaviour is intended, I will drop
patch 2/2 as well.

Thanks,
Yang Xiuwei

