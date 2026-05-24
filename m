Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB603955DB;
	Sun, 24 May 2026 12:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779624602; cv=none; b=t2OxVLVwI8I7RVCbm9Gne3SKu94mFwFCrwOgpLt7tvhfCkP2iOoOffjoO3ZifQZLhVlnbseje0yFLYD+9vyt7Q/ZHGm91wywnl5u8CzctXuRGyslux1Qp/mt52LigGYgrkRN+z/0JEZJULV9cqx7tb6v4yBXp7/4ZlOA7SaCGvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779624602; c=relaxed/simple;
	bh=IfzhtYOedGSjoatkdkGxhn7N/mpWTGdAGstC2y/P7Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h7e7OAkguxvuMtx5Hq9BAhhOOhAqr+ZIFzM21IAs68YIMn5q64u+aGa6trhePmME5EU2sdqO6s7eX/B9sajoNX/Z7PbRfSHsBjGeGhDPM9klLGHZTPXshBcTFvaE8P6KxboNaFt9X6NAXj/gSVe/jJJotQjs+93gEt6PDSX5kOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AY6UigMz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AY6UigMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C7E1F00A3A;
	Sun, 24 May 2026 12:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779624599;
	bh=B/QylLt9HVKlK8T1JVIaY7wYcc2y4/ntSZS0rGmUiwc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AY6UigMz/7YvehoynYgZnUaTyudH12tAoZWDzREIJf038fg7qLYIrfXCJKWOUeLC1
	 KBYcOJD1ZvuUZ24e8Yu83z5hKRA31cn8qH0k+muuVc8LrqQLHrWQ2LToJCGBYicCiq
	 0GaYP1YiHuAPLuGT0JoucPncIm2H/Hu7LU3iBlkEbuk3sOPxlXf5x0MCf3K3G1LWBt
	 GpYtNLSIFe/O8UHO9/ysYQIlNdjRwi7xuVLSaIdUY0gg7foiMMHw7T5pyP534dSnlr
	 L/HSHCCPvYwDoWTLjYQQsEvVP+PHAVcBn5fqLqEmugzxYxpsMCkSwmG5bNsk0bcUIW
	 86lby+ZKLXVHQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	Pavel Begunkov <asml.silence@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Li Zetao <lizetao1@huawei.com>,
	Robert Garcia <rob_garcia@163.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5.15.y] io_uring: prevent opcode speculation
Date: Sun, 24 May 2026 08:09:55 -0400
Message-ID: <20260524-stable-item010b-queued@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520062833.2563847-1-rob_garcia@163.com>
References: <20260520062833.2563847-1-rob_garcia@163.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Queued for 5.15, thanks.

-- 
Thanks,
Sasha
