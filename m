Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450BB3403F1
	for <io-uring@vger.kernel.org>; Wed,  7 Oct 2026 01:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791336737; cv=none; b=BFtHGYrB1e2fAWc3r4rOaC/lP0vGROaS0eZv6BFnr1/aAi4m7lKDM6wCHCObFpZa8qJli+m09RowPCkrTYFDT1UJMiZQzLDfLeVbRXz4YHqEkNYgSKf0R6CGNbypuWkC8nD/JZuM8MWbqrx/hZiiFfhNBZA7P70BUtHGHJkbnRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791336737; c=relaxed/simple;
	bh=lqtmMOq9NyJHWkCTixF/EfRvdzo9ti4x7BRbdW0dvpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rImPWfneo6Uz0rtMMReDO1wIDssNnkUsbBIVn70xV4K09ZabKiZnAEvRy/6IRKSJYooNrv7SZ7b8YlSEeVaFWCumiJ0CF5d/wRa8nWcoQqjx1lls3TtQIk6ynxpUxZT8TxW+MNpyKbdZVGVXKu5MRo7T/cGQM47PUjoKUOhSyLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVCasvP9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVCasvP9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a166199820so7946655e9.1
        for <io-uring@vger.kernel.org>; Tue, 06 Oct 2026 18:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791336734; x=1791941534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BooWm7URUcyrH2E2qkRWxlx7KQoz7GWFpr53v56Fl9k=;
        b=FVCasvP9FCP4taYfm6Pp/cJbtg0TdDpMFZR+V35uZjUu/heOUawDO/hCI3FrJy7fam
         NxnrzLwPmxlSjWwfVN7YOjGfFSMrRKOl8sd8FuEPSoc0dGOX6DWbyA2D9GZ+kaM6Tq3R
         WsQfYp8wfZsByC0cIN3TQTcLMXHett9eoe//LvN/EODYGz9a2a2utouHWA4BsIAGkpJw
         ERZME37rRAn9urM61FVbZJxXusNQ3ywvEOQMMMUQoXpyYT72VEea5HK6808szxd0JFVb
         ChYZ7fQERoUoIQQuMFUtmMkMNsxJ1pU3mICfe02ZgQEtL9OFGjxIduJizyWOuXpmSA3t
         v/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791336734; x=1791941534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BooWm7URUcyrH2E2qkRWxlx7KQoz7GWFpr53v56Fl9k=;
        b=KkYGEPScb616GaGrSfBVHGTyPuMBp+bajtrzYjvNN3Yp364ka72JpD3YLwfiYXZcgM
         VKl0d8ZoopuVQ8rx/SgI9Kg4eqDF4JMwvbMzXdpAeXxOM1/IOq9rF2ipYbtkqSmxMex2
         gn59TKrQHdVkmL6tYyrDA3AlkhswQJFeStC799f/MZBD7GSKN6tR3ud4nf8KnDmzT7Ns
         H2TQqJk0fHZXyJ3AxvsABbxX7zcHEx8Uhm29uaMb53IK0MUh+Su4f0JIDithVS77Lixt
         ht9xJ5Yt7L8DS30c2KxY3UWzexhHSp0CvMx3J0ktpSM7FNlhSHcpAkgYaoS3mebrRD8H
         msig==
X-Forwarded-Encrypted: i=1; AKwUvBxs+IhXt28eLBNDCRIxQ8xl1Hn5w4QYKNh5hKe43H3Of/hmUUFoz8Mtvn2izbua26Xr0uLOq04/2A==@vger.kernel.org
X-Gm-Message-State: AFuF++nen0zpTeRZ+lOKXFn/VUaaExcvFFFj/pjn84OpxDHYvNRmaJjV
	oNeRkWpGsb6auBOY+ldJ270yd54+g7mOYma1l4/S4qlkh4IobwuSBH73
X-Gm-Gg: AYBFou2CAy+bKdCSc0hCkR9aKLwE4kR29Uk+25p6LeILKxLbhOHstB5O1fK/+MTzzwC
	bmE0ltXplz6DBjAVqb1scjpmMIzjdtfm61YKCFyaDtEAjSl03bOGUNTT0m4G6p7cJ6ncI4pJ0W/
	eLcG3UcRYEYpspdXims5kI77MLDe1Hjg5fyDv9B/4eDxqH/YmQEg0dFwblvh3eV4S7z/EVV5LMC
	TjgdgGlv3KFO5QtDAgJ6HpYW/LqPeYzdnfHE0NVDwKdwF6GvZb1cpwL32v7x1AyPDbMGtPpRVRR
	is7udlVueCvPns0g4mdlfezuo4uGyn4zsKmxUlfVkERyt/aq7tnwc1ZX55M4pwHXnD4GJ7M4XDi
	k+TeG3uG0rw6uSN0oY6Tlb9UJxXzTWBgV8ho7apJMrgeq5iP5iyrbsqoeHaPc59wt4eWuXsgiP6
	czSEn++GxMJaIZ9Qxw7+IYHhjjzFJ25v3bSAIDIwM/igYpnu1H29L80EUFR9FgE52j7L8Bi9/ja
	m2nbhutukh2SVoap/9uLfCCohPxdmJ+mqzuOKmra9j6s8Dl8JEQVspNkmnA4G6kS4sLVpqQEHSH
	1rDB0ORLkk8=
X-Received: by 2002:a05:600c:810c:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a180422b6fmr8623225e9.8.1791336734141;
        Tue, 06 Oct 2026 18:32:14 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f6538b7sm21183615e9.13.2026.10.06.18.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:32:13 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org
Cc: asml.silence@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-nvme@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	William Power <william.power@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Subject: [PATCH v8 01/13] block: always adjust bi_offset on bio_advance_iter
Date: Wed,  7 Oct 2026 02:31:44 +0100
Message-ID: <beec7303891dac21cd620d2a47842f843b391192.1791336002.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791336002.git.asml.silence@gmail.com>
References: <cover.1791336002.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend bio_no_advance_iter() iteration to also increment the offset.
It's not currently needed because the currently listed request types
don't have a buffer, but will be useful once we add bios backed by
dma-buf, which don't have a bvec but work with a single range.

Suggested-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/md/dm-io-rewind.c |  6 ++++--
 include/linux/bio.h       | 12 ++++++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm-io-rewind.c b/drivers/md/dm-io-rewind.c
index 04f3fc8aeb6f..b22719c6411c 100644
--- a/drivers/md/dm-io-rewind.c
+++ b/drivers/md/dm-io-rewind.c
@@ -113,10 +113,12 @@ static inline void dm_bio_rewind_iter(const struct bio *bio,
 	iter->bi_sector -= bytes >> 9;
 
 	/* No advance means no rewind */
-	if (bio_no_advance_iter(bio))
+	if (bio_no_advance_iter(bio)) {
 		iter->bi_size += bytes;
-	else
+		iter->bi_offset -= bytes;
+	} else {
 		dm_bvec_iter_rewind(bio->bi_io_vec, iter, bytes);
+	}
 }
 
 /**
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 17944e44b584..892ca469c570 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -113,11 +113,13 @@ static inline void bio_advance_iter(const struct bio *bio,
 {
 	iter->bi_sector += bytes >> 9;
 
-	if (bio_no_advance_iter(bio))
+	if (bio_no_advance_iter(bio)) {
 		iter->bi_size -= bytes;
-	else
+		iter->bi_offset += bytes;
+	} else {
 		bvec_iter_advance(bio->bi_io_vec, iter, bytes);
 		/* TODO: It is reasonable to complete bio with error here. */
+	}
 }
 
 /* @bytes should be less or equal to bvec[i->bi_idx].bv_len */
@@ -127,10 +129,12 @@ static inline void bio_advance_iter_single(const struct bio *bio,
 {
 	iter->bi_sector += bytes >> 9;
 
-	if (bio_no_advance_iter(bio))
+	if (bio_no_advance_iter(bio)) {
 		iter->bi_size -= bytes;
-	else
+		iter->bi_offset += bytes;
+	} else {
 		bvec_iter_advance_single(bio->bi_io_vec, iter, bytes);
+	}
 }
 
 void __bio_advance(struct bio *, unsigned bytes);
-- 
2.54.0

