Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C6935AC2B
	for <io-uring@vger.kernel.org>; Mon,  2 Mar 2026 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772457048; cv=none; b=Mc1mq+OYDnnGcI4WDSucYZTjYo2xe209WHJohm6Y1RLFOeZwkqB5H2Zf0ZCBlb7kecsrWY1p7GgJhHCG49wRzdhCoCgQ5k/iv5DY+182bwqPxSfhWWjRgphVIY51J+vu4SS2IHA43+4rlRS2Y15Ys45NiXWZEbH+CV0Tmsrg4Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772457048; c=relaxed/simple;
	bh=0KqgChM3ETiTPVazylSdCcN5lxw6pHIUcW3hrx1FAZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZmQwVu+VY+4VkbPX7/ukunDNmoX6RPFknDozQjYefZy1Fx2FVE5Up4UZ9QTXIUQF3LDCBCLK1xRFVRHXXRH+FlIVkds5SEQaJ0ypWPpX+REjV6EWlftPOgh2zp96kU9j9dq0lhO1JbnHs1rXiGOkOsI1uc1d4baDpmzFLjHzNzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYFK8oE4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYFK8oE4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4833115090dso45764205e9.3
        for <io-uring@vger.kernel.org>; Mon, 02 Mar 2026 05:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772457045; x=1773061845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWw+SctroKTtWKTHCzhi97rZSR42cpiAZ7HwOlrAonQ=;
        b=nYFK8oE4k2/5CId+8ewgPT66d3drQt1DNQqOo3HI50hKxdZwqzdmTD0TtlYk2d9+qf
         ZnngOU2kssW8d+P9VgqnimLdPUj+jXwqv4gFx6O/+oX3zCRVYPGTkE6Se03gnGWD7sHE
         wzwzEb5KDziHzKr/KakL7U95cCaZQ44pCUt0KMuEMFkNLW/pREmSjc1C9f7c8INRzn/k
         Px+28FEr4pcYUcdK/OvxAgCTR6t2UqWb3F1ymsVJBjEGQ6gnIkfiPXsxNsoWj4yrZw2t
         3aLUTFNIpJfOLfNYj+4IcbGfMkfzw8nWxMOdNSTuJrc3Dk9QIDC4Oi1o47rdErrbYKNl
         KVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772457045; x=1773061845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rWw+SctroKTtWKTHCzhi97rZSR42cpiAZ7HwOlrAonQ=;
        b=WFkMR7v+YlLjKzs75cLvi5S5JQQVEkAzoS1zfgf5Q1YZLtjqTV+H6pDDAo2lb4YlKm
         zflR1Rv1d5IMfBJlLvnHbUyCgNHrDIfl1bKSy3wb/RlWVjOnsFQef5jRDmNK1AEYA11O
         6w96x/l10a/jjm47m2anrELiGaGN5M9CAQMD9KSNO7V8E9DaV8i+WVaMrUu5+ipl6vkM
         oxxRcFeTJ5Q9zfPKHdRNfPlXKco1SoZHfxCvnCBe5shw2A4bJlJ8APqbMOo367PUytEy
         fQSV71N7rmlHv6vDZEHsQqytlGX0MSw08J2SuO9oBhWzEwiAtTUbC10Iq7YfqzJu8mng
         xLIg==
X-Gm-Message-State: AOJu0YzZA9OuQDM599aIKuD0Qrm7TnupdrZB1I62VaxnedvqtFYQa9xN
	FyoRvjrnVhWQiGo+2zBWtly4aOZoyxcnYBtkPr6Aozml3kMcqRp6ro6KK+bAnA==
X-Gm-Gg: ATEYQzzt4DL7fHo90JDn8COnfzyN9oE+d7k5Ydtn6BBHXalWojsAFdLB9VpFJ2BrBLX
	Zvw7BxFeHGfuJVGWZAonrodUlVLpZnTjxDFFJbUEBLWDXUWDu2x6rVQ1IAkHsVoYSvpAauugEKG
	zxH5NxXkO1C8Y18H1GYCtuc5tKyZUZuhdJE6sNxBYcIi39OLvKT+OmuGtfmRzCydJJejTU1eqpM
	eDEzBk+apBMkRFnMX7bq+WWx/bI3mlxfkVkkJcpmsvJ7USKH/A12LEah0xXg7x3plt+A0ujl+zg
	UDwVzhBoIhdhy24Evtxo4WbFvidwG9bYRaj1PsvvHWfEtYuZWgvOI34jUu6CsQ6vWzPrGWmQL86
	Ae2RW/sR/QOoH8j5bMMAut2+DJXW6C7VK5VG/6xBfvjt+Gggqxn0ITeaM4fMuZN9LE0tDBBYKO6
	LVz6JqFWj8QQKUMmJqFmSwVdXMyZRm2w+r6xRfbv7v3PCWb9ByhtBDFWXCeNTk9fl0oKQMuHpWA
	kzIhU03uA==
X-Received: by 2002:a05:600c:c490:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-483c9bb1fb0mr202615885e9.10.1772457045001;
        Mon, 02 Mar 2026 05:10:45 -0800 (PST)
Received: from 127.com ([2620:10d:c092:600::1:cad2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b346ccsm259935925e9.2.2026.03.02.05.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 05:10:44 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	axboe@kernel.dk
Subject: [PATCH v3 1/4] io_uring/timeout: check unused sqe fields
Date: Mon,  2 Mar 2026 13:10:34 +0000
Message-ID: <e046ff46ca4b68f0e73767f1f3aabfdc9d97562e.1772456786.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772456786.git.asml.silence@gmail.com>
References: <cover.1772456786.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Zero check unused SQE fields addr3 and pad2 for timeout and timeout
update requests. They're not needed now, but could be used sometime
in the future.

Cc: stable@vger.kernel.org
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/timeout.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index cb61d4862fc6..e3815e3465dd 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -449,6 +449,8 @@ int io_timeout_remove_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 
 	if (unlikely(req->flags & (REQ_F_FIXED_FILE | REQ_F_BUFFER_SELECT)))
 		return -EINVAL;
+	if (sqe->addr3 || sqe->__pad2[0])
+		return -EINVAL;
 	if (sqe->buf_index || sqe->len || sqe->splice_fd_in)
 		return -EINVAL;
 
@@ -521,6 +523,8 @@ static int __io_timeout_prep(struct io_kiocb *req,
 	unsigned flags;
 	u32 off = READ_ONCE(sqe->off);
 
+	if (sqe->addr3 || sqe->__pad2[0])
+		return -EINVAL;
 	if (sqe->buf_index || sqe->len != 1 || sqe->splice_fd_in)
 		return -EINVAL;
 	if (off && is_timeout_link)
-- 
2.53.0

