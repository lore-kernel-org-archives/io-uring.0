Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D164A32
	for <io-uring@vger.kernel.org>; Sun, 15 Mar 2026 05:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773550961; cv=none; b=Vdwj+Ji8pgPzBeLqa567WmZMQCYWXuk66QPZiBKFBjPl8tNqXrQIiEq4aL5O12ZPIf5O2MrZIwKBpvjDDCEydmPR+ljDISRa7QnLV1+uDYqQ5H31fI8Xq04xo0ZzTmglYpFeXcGG4TeRLMwL6RpjYq6sszqMN/5GhaZqdeYcwj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773550961; c=relaxed/simple;
	bh=94gL0QhlWjUJWjxQeXmbZH6wRRiZR+Slpj8l+cP9dYA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hEvti1pdXO4t16Fn5ieP00zxwxldUfsqVc9JVULinNyIFRqaSxfN7rZGlrUVA5s1HhbAfUCllJbvKHSlPqC19fq9PRIH4vv0vEn7CC+lssApmSvyBrTPq9d3gUky5DHqTkc5kj49l1XfgrvwpyPUJJ8338f4Fg6R28TTYx7cr4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GEZTbz11; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GEZTbz11"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=94
	gL0QhlWjUJWjxQeXmbZH6wRRiZR+Slpj8l+cP9dYA=; b=GEZTbz11YkO5nG16pV
	bfbR0yeTavqHaqS9uW8VgSvKPtTHlh9pBU6gzOW/7uoN83DHjogZuBNF6AQ2OPKG
	kmbR7O3aq0lDv50iUwXAtSX3mYiHQ5PZKW+6MNalSZ14WVmZuobnKTOOAYHSJp+C
	oOBgKOvi5RTcDFwsZ4kt197Bo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wAXn+pZPbZpKtVLBA--.1614S2;
	Sun, 15 Mar 2026 13:02:19 +0800 (CST)
From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org
Subject: Re: [PATCH 2/2] test/cbpf_filter: skip when openat2.h is not available
Date: Sun, 15 Mar 2026 13:02:17 +0800
Message-Id: <20260315050217.121292-1-yangxiuwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <10b4b9bf-2dc8-41f3-bed2-110170dff236@kernel.dk>
References: <20260314083538.791693-1-yangxiuwei@kylinos.cn> <20260314083538.791693-3-yangxiuwei@kylinos.cn> <10b4b9bf-2dc8-41f3-bed2-110170dff236@kernel.dk>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXn+pZPbZpKtVLBA--.1614S2
X-Coremail-Antispam: 1Uf129KBjvJXoWruFWUCr13uFyfJF48Kw43GFg_yoW8JF45pF
	W3G3WDKr1DZr13Xrn7Zr4fZrySvrs7Ga45JF93XrZ0ya45W3ZFqFWIya1Y9FyDCa1FgF10
	qF10v3WY9a15XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRxOz-UUUUU=
Sender: yangxiuwei2025@163.com
X-CM-SenderInfo: p1dqw55lxzvxisqskqqrwthudrp/xtbCwRtt-Wm2PVsnaQAA39

Hi Jens,

On 2026-03-14 13:35 UTC, Jens Axboe wrote:
> liburing defines open_how if it's not in the system headers. I feel
> like all you need to do here is remove the openat2.h include, rather
> than disable the test entirely?

Thanks for the suggestion. I had actually tried that first: removing only the
#include <linux/openat2.h> and relying on liburing's compat for struct open_how.
It turned out that this test also uses the RESOLVE_IN_ROOT macro (and the
filter logic is built around it). Without the header, the build fails with
'RESOLVE_IN_ROOT' undeclared. RESOLVE_IN_ROOT and the other RESOLVE_* flags
come from <linux/openat2.h>; compat.h only provides struct open_how when the
header is missing, not those constants.

Defining RESOLVE_IN_ROOT (and friends) ourselves in compat or in the test
would duplicate kernel UAPI and could get out of sync if the kernel ever
changes them. So I went back to the more conservative approach: wrap the
test in #ifdef CONFIG_HAVE_OPEN_HOW and provide a stub main that returns
T_EXIT_SKIP when openat2.h is not available. The test then always compiles;
on systems without the header it simply skips at runtime.

If you have a better approach in mind, I'd be glad to follow that instead.

Best regards,
Yang Xiuwei

