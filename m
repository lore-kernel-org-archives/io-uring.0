Received: from bolin (vbox.bolinlang.com [155.138.147.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0D0219FC
	for <io-uring@vger.kernel.org>; Sun, 22 Jun 2025 04:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.138.147.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750568118; cv=none; b=F2MI/67x26P+yfRnnmIQb42QDV6OY6qKQG1Yiv5PzFGI/hUP3EOanIAN9XHecpkwEobo7ziuz4UpFbUvJ89HvN6GPmKNlM5AGRiJD72PQefX4wRk8H2y4Q38M6WACoGS2kHeUtvtkcMZxV7Xtn2crskDqBVPwqyoHm1uCpbCdlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750568118; c=relaxed/simple;
	bh=trq2IBXlxZHH5Rbeo2tJTXJNcjhM+5F+uWEfbTvGE7M=;
	h=From:To:Subject:Date:Message-Id; b=MPuuoaEDixyDZq4RpBg3te4CzdcxW8WWbMB6tAqBllP77jbBmIR7dQGNZk28xp/UqG3/Zp8te/rJmb2vly/cmsbl3wsa6fmGd7UNatSxppPVuFCs1IvmahPgYuxtiCvDaMdcOTfGUnzbKueq8h2VeWp97I7lTbSlGYFV3+F56UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mail9fcb1a.bolinlang.com; spf=none smtp.mailfrom=mail9fcb1a.bolinlang.com; arc=none smtp.client-ip=155.138.147.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mail9fcb1a.bolinlang.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mail9fcb1a.bolinlang.com
Received: by bolin (Postfix, from userid 1000)
	id A15A2FA301; Sun, 22 Jun 2025 04:46:38 +0000 (UTC)
From: Levo D <l-asm@mail9fcb1a.bolinlang.com>
To: <io-uring@vger.kernel.org>
Subject: Place to read io_uring design?
User-Agent: mail (GNU Mailutils 3.15)
Date: Sun, 22 Jun 2025 04:46:38 +0000
Message-Id: <20250622044638.A15A2FA301@bolin>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>

I read the man pages. I have a good idea of how to use the API but I can't understand why the API is the way it is. I have a handful of complaints, but I would rather learn more about the design so the API may make more sense to me. I'm specifically talking about the kernel api (I used it through syscalls,) not the c wrapper. Is there a document or something I can read?
