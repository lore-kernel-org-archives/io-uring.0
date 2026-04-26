Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284C735A39D
	for <io-uring@vger.kernel.org>; Sun, 26 Apr 2026 11:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777202873; cv=none; b=n9M/+edj5zR2vdcRw+Bp/aW0FdUOJEvHW5UVgixwK1v42r/2kkHGR3sVzxxP6UI98tMUlw8K4IpthQH0uFkHob8ZI4klkY389oE+QZaSmwgBg0DlJjUl/tCjyPkCP+TAFVoRg11SbNDIq+nkre7wWtmIGMYpeT/XMSwFBStG5zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777202873; c=relaxed/simple;
	bh=7nrkzeg4m6qQqWt7NtbmG6+drhuVwn+TuG5YQYbaAEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AcNulHCnPfuOXsojgcsqRVVJziUYvAS1kVTOim+froZEsovwrt4JFo2Wfq8xFoTTRgVUctxvyFWNuKDQ0ZbGHQqSyOf5qGRO0rjvw22D+/D4tYXmi2weoo9sohrHiUklZeG0zxz4PObfQN91UcErkDnA+WlAJq02nOBuRBGIuFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=X5fRBRx7; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="X5fRBRx7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=St
	2bXtNeNLvtxztkIU+oFhybqvzw25RlANT6vV9KCRM=; b=X5fRBRx7BbgphxgzK0
	ddy1xX4na7fgW3qvWvkb1gpt9W4eJ840aIttXWnLEgECKU1wlZxNrchbpiMn2TIY
	RdKAfBz9FNZpK5YqNsoxidqbRyw/ICJGlyE+rpli27oVUHCwXm5ldIzqwr1usB2H
	nSvbNM57eOVFnUSFvaC1PjG6w=
Received: from haiyue-pc.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCX1OSq9u1ptpJ3Bw--.6916S3;
	Sun, 26 Apr 2026 19:27:39 +0800 (CST)
From: Haiyue Wang <haiyuewa@163.com>
To: io-uring@vger.kernel.org
Cc: Haiyue Wang <haiyuewa@163.com>
Subject: [PATCH liburing v1 2/2] .gitignore: add new test build output
Date: Sun, 26 Apr 2026 19:27:31 +0800
Message-ID: <20260426112732.300165-2-haiyuewa@163.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426112732.300165-1-haiyuewa@163.com>
References: <20260426112732.300165-1-haiyuewa@163.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgCX1OSq9u1ptpJ3Bw--.6916S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRicTmDUUUU
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbCzQu9KWnt9quzGwAA3j

These two files are new added build output:
  test/bpf_cp.tt
  test/bpf_nops.tt

Signed-off-by: Haiyue Wang <haiyuewa@163.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index c6936314..e901d9b0 100644
--- a/.gitignore
+++ b/.gitignore
@@ -31,6 +31,7 @@
 /examples/zcrx
 
 /test/*.t
+/test/*.tt
 /test/*.dmesg
 /test/output/
 
-- 
2.54.0

