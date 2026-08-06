Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178473B8BBB;
	Thu,  6 Aug 2026 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030942; cv=pass; b=ZTe33I8WmGZ2gjR2+Lyij82c9beuDX5j4F5egkhaSW1F8XRm+1zJKwfUUspaujJiyIAVVK8b5BNx8x2xfAbKl4dH2g4mUywAHI+We8xmiF9ZRoln4LsLIc8z3B2YeCOYbLIHwfVOBcXa+l0XNOcJOxaGL62HfJFXEvJPbF5XgFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030942; c=relaxed/simple;
	bh=/oW3er4sqRCc1h2LisJaGMPNfRF7QTJMp6Eo8XT2dqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KGszpLE5ROks+CL9QjDgChpRVP3LRd8/XLrt68FD9p8j1SYndm9THT384zguDUGTWJmzc0Zlr1PCGFt6faPydB9zhBfnk0KpNwusNftRq9NpLOHDnLn29LprG3XTxC6x9qjmNKo94BS/5Mqf2pEw0IMvsaJiFj3s1JUlkpdWZTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=CQ0J6ufO; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="CQ0J6ufO"
ARC-Seal: i=1; a=rsa-sha256; t=1786030935; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=in/m0RkusI3Y7gcx6h+VukHX9gvSeMQhHEri+pIq65Sl27Mt0LFDVEPuD8BP2JdEq9rOyDCdEPppTNEooTdTOuSXDMd777WrJ6W+U6zFPe26RJuTEj9hHv8r9yn8f7naFCDTVW7/zOrl6JuU33mG9RUao8oHpGFiUPxcHJPn4XQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1786030935; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/oW3er4sqRCc1h2LisJaGMPNfRF7QTJMp6Eo8XT2dqk=; 
	b=HkK+zjXXX8uT7J+9H3DmO7Y33Brquoqkdz7Po4918YHVayidNuaTBALrJIywmztFPeTrAtHnE5AOTfxtso1g7J1KqdHxxU5uefQ1mSfVZ9EoG4Ht6CEv9cseqQPaPMe0krmWZBDb2G422WKRNZA0yVvk+QHmjIFwKC0qMUirjZI=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786030935;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/oW3er4sqRCc1h2LisJaGMPNfRF7QTJMp6Eo8XT2dqk=;
	b=CQ0J6ufO4CARcZOq9bGjNxL1cV2sfYQyVYXqXePKIedZT4oXcgeZ2EssZWRR7FxB
	vEGa0ETLBfIcB2BolaLU62BWS2Ru2GSXdHZRDSPR+BxHRRL6FhyNDx4wB6Tl0Nwy6yU
	hdIbbFUX5SIei5HalCq7kS/1xiUp/WGpILAqkm0Q=
Received: by mx.zoho.eu with SMTPS id 1786030932797290.52232199042635;
	Thu, 6 Aug 2026 17:42:12 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: io_uring/memmap: compound allocation larger than accounted region
Date: Thu,  6 Aug 2026 15:42:00 +0000
Message-ID: <20260806154200.183725-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

io_mem_alloc_compound() allocates get_order(size) pages, while
io_create_region() accounts reg->size >> PAGE_SHIFT. For a ring with 4096 SQ
entries and the default CQ size that is 64 pages allocated against 37
accounted.

Is that intentional? memcg charges the full allocation, so only RLIMIT_MEMLOCK
undercounts, and the gap is bounded by 2x. I did not want to send a patch for
something that may well be a deliberate trade for the single folio.

Thanks,
Ali
