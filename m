Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206058;
	b=xUdQ0Yq+gk06mKOqIsUw+Xoz7efl/aMIFQNB/HsWzUG/SMh7pJ0Z09mAQvWg2vyAeGce
	 iAdH1jE5ojTzqPDalJCfnQFv66yX3haFXHlmQZYPZoKlHC9FNwRX+N2UIM/jvQA/jZPOj
	 q6BXWLx9d6vs12tINLlS9YZjYAo2yXbNm1Orhm49zWXqWNRRi8oZs4WU0vmINzeZ3jq5O
	 ZepaZ6KD/FVOcmeuAyymDr5TBhz2Ta91IOgCRd8cPEU3v/norqDmkGwVNfZavl1xXwurN
	 5VGKwuZjyrLCBrUYyG2AUDe5Dh85v2zTuqp+sN+SIsnYm9P+8x4evoyeg25x/TINnlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a9qm03+EkAo2PvrxotT18r+dZrxHkCK3EcFbLVT0Pug=;
	b=4nueo3TRuMfxWDMd9NF1ePZZCToGAX2HT46zFSzc2fgnrCyDQie40Dp2r+L/kHj8DC5P
	 ofeF8GGk+GtYmEDrw4oSgJxr369XJRUOhuSNSSV3qArmCal8JWUaGpFD1x0tVURC/ZARk
	 E/79PwdbwCUNrxXiUFFFDDzTttcD3fH2EVWsuY7MDDit+gw/Vkw1piNDrqDixkUqavRtr
	 rM2945x+j6DsjlB7AMmNvFzt3WiCzWRUROx2lnJjZIIQMxLNaINrv0U6Q3UMJr+LW0EjU
	 zT+u5TGRxIh3y2PcBXQa5HPjX+lhZDNPYECGb4hBhpYay4111nS0Omr3Aj6WPTJYZyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dkoO+zy4;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E8D60A260A
	for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 16:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63E8D60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dkoO+zy4
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-82109f51565so597775a34.2
        for <io-uring@vger.kernel.org>; Wed, 28 Oct 2026 09:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793206057; x=1793810857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9qm03+EkAo2PvrxotT18r+dZrxHkCK3EcFbLVT0Pug=;
        b=dkoO+zy4ncy3ff8MFztdXuHosMaf9wA/mIIqVq2kMlqllEknK31WJcIUkHXMTrK+oo
         FEG0LVD3bDvdIBMEvxts2Rs7ULK//OQh1zG8/ofLrcwonOnYd0PpMbndcqMWomiftY05
         kNm6p758BNqUTsA8xAf1F7gEkoXkseISPyIG8sBXE7z8Y5ej2neds23anovcFj4olxYd
         hn5lhG50V11ftDKPxi8OlGPy08w4PaWvmfFqPnoKAWJnePv5sKkn6c93fYXX4Ahhf2Zt
         O7jW+Ucq/vAsG4QSmDYTOKsUa/gjZwtkWHxDCoPbdLX0Tc/IfLsp46vFAr4RHVv3gwM0
         ZARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206057; x=1793810857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a9qm03+EkAo2PvrxotT18r+dZrxHkCK3EcFbLVT0Pug=;
        b=ez6Zpr6NyUgOWlKgH/5a50uxooVCOIn/l/N3TKW5683VvY+83Fdzt0s9TPJp9C2q82
         ICKNmHKrvSiNJNbkbspTw0V/bohjP5tTTCxmLpcxo92LxekHxK9fw9uHkCOfC0FnFMaZ
         Qvz5ZD+yA4sJvnK37BIlUolzbwiblS4KjOGdrEC/ayO/L+pP4PLwDZxNnuH1ASfFIgrT
         blWPp2PKx0/R2UninHsnIB6WpW98kZl8X3+uJL4onng+WkswVGrCh1b2Fu7futyUFxRk
         w8h1NfFE548ITKZ2Bkplkv1TpHtQsBSSmDHMgiSQCouU1L+cdndpWSJ1U2oDmZL25J1o
         Y4CQ==
X-Gm-Message-State: AFq9FYJ27MMFhogdU6vpYZsOcZdFPX6ZuachE1B2J7FJU57pjfrUqvjx
	Ytkb4jO+JBdSKxh6vz90biL8U+19HFrVZIzHcXKKLtQZTDuWMbDRZLx/+W8cVg9IInDEx2W4FP5
	YCLZLE3U=
X-Gm-Gg: AYBFou2yqisxoJv9Zl3FBqjUSSe6ldq3ZeIIiAV6+UUgDMDaHffrdtvfi6EFr7BzEMP
	wnhpxuyqjDy14aFe26Wb5Pm5k2uxwnqmLkonqkj7ipL9CMUv7IKyREvI7MXvUhyd48+2PsfnEC9
	sKgpvFAseDXmfRR6glaKrNku6+7Y7V3EbrIClHMpaSKKeBYYbKAq8iUgilUmMGiykrgpYK+t2Vl
	5S3D4TuxX6OEAvltxxiP46sUG9ClYgyRMPX90hL15rFj2ai1H9mvHUFAVDnjvR21lGO+YJDg8LZ
	7qYUuFd9LIz4A/QlYglgF9+m1vQpQMfZQo0DphHMGYlKawSu3+Yw0NUq81QxO1cA9mKNDU/f004
	Wlb4LDzy4XX5grRJzYJ3sle9yEWCg5wQWUh8lmim8ZH4Eaj8NAZM4mff8kgX44ld7zXWU1XPANz
	YoPAqdk/HGsNWVzYrxCfondEccMNg4V87Cp4Gwa28HvbzUmxLXT5sy2H7aw9YNFpvFe+hCJ6qr3
	kZMiuYki/RG2/9J8BZ2iwuK8n/jEOBbZrAedx51+r+Js+hKsMl5197GF8V1nYWJK2NYdViLAcbG
	L0zhx4WqeCWnCRX6/7GIxreiIlRf8bCii++WAda3hn8vPJ/XHVnUrrF27mbjj7VKiYe7IxETgQ=
	=
X-Received: by 2002:a05:6830:7190:b0:81f:2b74:7fc2 with SMTP id 46e09a7af769-85ab9873afamr2768402a34.8.1793206057219;
        Wed, 28 Oct 2026 09:47:37 -0700 (PDT)
Received: from xps16 ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b206f8a41sm2019182a34.25.2026.10.28.09.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:47:36 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 02/10] io_uring/rsrc: charge buffer arrays and nodes to memcg
Date: Wed, 28 Oct 2026 10:46:50 -0600
Message-ID: <20261028164732.1264069-3-axboe@kernel.dk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028164732.1264069-1-axboe@kernel.dk>
References: <20261028164732.1264069-1-axboe@kernel.dk>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Mason <mason@kernel.org>

The io_mapped_ubuf of a registered buffer has one bio_vec per page,
unless the pages coalesce into huge pages. Huge pages only count against
RLIMIT_MEMLOCK once per ring, so a buffer that maps the same 2MB folio
over and over in a way that defeats coalescing gets a full bvec array
per registration while only the one folio counts as locked. 1GB of that
registered in 100 slots took several times a 64MB memory.max, with 2.6MB
charged.

Allocate the io_mapped_ubuf and the io_rsrc_node with
GFP_KERNEL_ACCOUNT. An object reused from the ring caches stays charged
to whoever allocated it first, same as the io_kiocb cache.

Fixes: de2939388be5 ("io_uring: improve registered buffer accounting for huge pages")
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/rsrc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 1efaf29514e8..d569cea12df9 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -162,8 +162,9 @@ static struct io_mapped_ubuf *io_alloc_imu(struct io_ring_ctx *ctx,
 					   int nr_bvecs)
 {
 	if (nr_bvecs <= IO_CACHED_BVECS_SEGS)
-		return io_cache_alloc(&ctx->imu_cache, GFP_KERNEL);
-	return kvmalloc_flex(struct io_mapped_ubuf, bvec, nr_bvecs);
+		return io_cache_alloc(&ctx->imu_cache, GFP_KERNEL_ACCOUNT);
+	return kvmalloc_flex(struct io_mapped_ubuf, bvec, nr_bvecs,
+			     GFP_KERNEL_ACCOUNT);
 }
 
 static void io_free_imu(struct io_ring_ctx *ctx, struct io_mapped_ubuf *imu)
@@ -246,7 +247,7 @@ struct io_rsrc_node *io_rsrc_node_alloc(struct io_ring_ctx *ctx, int type)
 {
 	struct io_rsrc_node *node;
 
-	node = io_cache_alloc(&ctx->node_cache, GFP_KERNEL);
+	node = io_cache_alloc(&ctx->node_cache, GFP_KERNEL_ACCOUNT);
 	if (node) {
 		node->type = type;
 		node->refs = 1;
-- 
2.56.0

