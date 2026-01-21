Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA75423A60
	for <io-uring@vger.kernel.org>; Wed, 21 Jan 2026 22:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769034215; cv=none; b=gj2PCpVFBXUAgo3IahUBH72NHY6Yev4p4ZkAtsIExj+fSSbB21dsMjZVD+2EcntNxEkwU3gwtsjiJorjuCJf1k+wJyOkHC6K/jjeV8o2A7bF2xHlmgYSBOf3ijpIRQd357N3l2Bs3g9c3dJht3cxINoc0SR6GS+oxNCC7552WzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769034215; c=relaxed/simple;
	bh=p5c3R/7UgAcitLZhb1KfeV0GkiliKTdUBDo8omqavBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eX5Uy704NQUrVmt1YIEXayQCAQ0JxmfVUgvHWQlnEUQ3CTaijY0xwNczVyVBKIp/uRyGWOmeIOduRuVY1klTgTBCgPQ540uu0K/frreNwK15EMKu0eyuvKd7fF+TsPfgBwn13x6yEVZALJMkxKBn9mqkJWxnh5hseyzNmo+szUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpAnZQZb; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpAnZQZb"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4358fb60802so168773f8f.1
        for <io-uring@vger.kernel.org>; Wed, 21 Jan 2026 14:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769034211; x=1769639011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8+YlHxnCds48LVn9WvKBgrDdQ8fHdQBH98uMG7Rc9I=;
        b=XpAnZQZbME1EIcA46Yho9Oof/6UggGRyKKdf3g/spPSwyIRaLKQEiru86IHofJ7wRe
         tGPnOfetyYfseTTZuS8H57XqDDbKuY2r84QHUO+YlST2xW1tGN88eq5O9F7Mnx3LGTS5
         tww64AemVQbgP5V1R2FkWMOJcunKwd1nFdhyDn/grrweVcWQ2mGs4QhKFgXRqAGM74hW
         341xCKEbKRW4BjtStX4AcxMt94zt/Yk/yTS2edZalj6wIQYdZTUHndai5uZMS0uEzoiq
         iWpTQbA6/44mRa5BsyfY65O1oEJhvXMAoFnIYX1csbOw3QWaGj4lrgU8GEfSHgrhH44T
         ttpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769034211; x=1769639011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8+YlHxnCds48LVn9WvKBgrDdQ8fHdQBH98uMG7Rc9I=;
        b=b0b+kU8zW/IJiGRel84SUNbdfFt+1bWJlJV5ixznwhVoNucJ2OytCBCv8igkgg6XO5
         T+zswiEFyPtEOv8wxIFBAQaVWZfbfLzTCUPAdg9dHXNmDDik/90AbOrtnN3Lb8eOAaae
         3spa/KSJGhcbXQ6RM+Pl+H2yvF32Wt/wMeUcOnAq7nyRQRq7/7h8ukF4WzXM9i66oJ2L
         +jmrhiR7wQbn5SimEg8qHaf1CESsP1h8tAhAjtEm/dgaC1RNZrFy02/q6LX3PcTzKHK8
         2EOEoWDa0tzFp/yIjRnLpDk99DKWSZNhLbCW86GMnifzb6PiFYWNM7BEVJMM9PtWu+s5
         JM2Q==
X-Gm-Message-State: AOJu0YyQhgjClz3er7ARK1wANUo2ZWsNnsHy4YRjeBT5QBHNXFbGH0jH
	bEL3rETuFdZYTpN1cc8m2PyNVbbqqOmpXRJZlzaOTo0FYiC/OaWgWVOXnYvjjw==
X-Gm-Gg: AZuq6aJP4OCBPWWd+eM9lnK4pyUn5tNraNkmO9l5b1H0uRPGbg7CTS1uCLLqC/Wvmyv
	66thgE014wTNUiT+RCfgfSOfMydir6/bOh3Q7WgdXvF/eGmzN/JQpIlRvgIbOlxapamINgW0HEn
	tdx7CeJgDQgeWld80vRCnPsqCGmI4IrlglAFBcQi+FM4Pyht3shAe7iNMj9brrHRKSVJwOK0tNz
	NatvPzSunZiPf8kQMalJbvJYVD2i4jTtiYafvpF4oM92QS1gz5jklvk+sutGY8jyCmeoy1X2TCO
	GsAMSqcwh90/Qa4bzQIK3f4UKkTxW8cedXJHiJ6zVp4hlWGIE61yCVCe7rRPA4IaJF1zym/WSx3
	XSqtz1KGGC0RhE1cypuxMw1yukuuKQmSYFQ5TGO/ndvbDtX4YEgMBI2gFqy+2svtwNNGdUuu1+l
	u9apzEPu6rMKqNxQVF3UwFxPE7WlWtHicb8a7gsM2d1pjzEQmI9F1dKPs475ZrvoK/yCGU8nu29
	DB48dlNh0MD7GRHTw==
X-Received: by 2002:a05:6000:40ce:b0:431:2ff:128f with SMTP id ffacd0b85a97d-435a5f4df12mr1834624f8f.6.1769034210441;
        Wed, 21 Jan 2026 14:23:30 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921da2sm40011103f8f.1.2026.01.21.14.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:23:29 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	axboe@kernel.dk
Subject: [PATCH liburing 2/2] tests: add SETUP_SQ_REWIND tests
Date: Wed, 21 Jan 2026 22:23:22 +0000
Message-ID: <0756e58db8eca305ccdcb16949cbc49d0c931411.1769034107.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769034107.git.asml.silence@gmail.com>
References: <cover.1769034107.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a couple of IORING_SETUP_SQ_REWIND configurations to the nop test.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 test/test.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/test/test.h b/test/test.h
index e99a8d20..f6baf61d 100644
--- a/test/test.h
+++ b/test/test.h
@@ -20,6 +20,8 @@ static io_uring_test_config io_uring_test_configs[] = {
 	{ IORING_SETUP_SQE128, 				"large SQE"},
 	{ IORING_SETUP_CQE32, 				"large CQE"},
 	{ IORING_SETUP_SQE128 | IORING_SETUP_CQE32, 	"large SQE/CQE" },
+	{ IORING_SETUP_SQ_REWIND,			"rewind SQ"},
+	{ IORING_SETUP_SQ_REWIND | IORING_SETUP_SQE128,	"large rewind SQ"},
 };
 
 #define FOR_ALL_TEST_CONFIGS							\
-- 
2.52.0

