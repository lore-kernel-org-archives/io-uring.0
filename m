Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B2742E004
	for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 19:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792092732; cv=none; b=DOKpuoPYTTXVAt6T5p/GGkyLK+HETXKSFX/R2zkdl2qttaz9i7v09/oCOzC/fXDmiYu1hJc97mdwlEwYrqATucRH5SGru4NOBPsvE+QSZ7hDr9QfsGSnyZSbVw0+8AdcGW+NChLz8otWr0iDB/rWCoZDcRH6JP98DpKCvkfDlc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792092732; c=relaxed/simple;
	bh=+m4ft+wbuLYwFbvEiboS793/e6kDgJNCTWHIuhFdhwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fvs0YqvW8cgzwWm7IZLxUaaK+Ic1CneWO3u+5vSv6HjUK/YLCV/7WFb0nMOBUGm2qcrWXBfvND7Ntk45fSUFCBmBHgoG2tDbZpwTKbmBlAiItFVUy+1F39nRHX7fW4qyR9foNMVpC3S15xnbslviVxgqhBxtduqeeGMstt6pWtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=d65RFCqw; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="d65RFCqw"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93e027da22eso383182785a.0
        for <io-uring@vger.kernel.org>; Thu, 15 Oct 2026 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792092730; x=1792697530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncjTJE+LbaAa0bnvjAlnbOVDUutfCbpS45SUJgxv94E=;
        b=d65RFCqwzcCCL+Disixxs0ToSRbVpN5gew9fO4G5L8l5qh2icQzyTpi4UfdHghdoJn
         t6jXP+ge1ZCxb8H285A6c5DJP2QpOwufixhybg/ylx0r8TPHScbhGa+k4AQhNmo6qtoy
         6OULcbBw4iUuf8Zu/VA+I+17Jai6rQv2BXY293x0Kiq+wLMDlhuRe3k2hX/602pjr5hV
         97Ukzihm+SuZ5So9RS+gpvgl2B6bYwVQg8pWmcRljMl0OWWVaCoQyoUi9EL9/JaynMd1
         jPZ/euCPMZTInMll0fP+yhAKJdtYvhPiae8Hw+o9b37v4TkwDBfDkaHjfbmuuVpcVMNw
         yeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792092730; x=1792697530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncjTJE+LbaAa0bnvjAlnbOVDUutfCbpS45SUJgxv94E=;
        b=KNbqutfmxTJYfTSuLFUDd7CYRxAT4hHO1CWOQ9ViU3Yz1fvwT71kPycHOhsqyz88cW
         gwv4Oc9WL6jezfJHEJ5JLqjmhON/qLbJsSdYnjGMkIL7o0qhXnHYbvswpinSg+tnPBk0
         dQlKqaYSfjV/T8IEvAWDFhWjjDMjiE2W8TjqN3S6l1Wq3/UT4H42qmBVQeFsW+EXwiJs
         R5F1BziXnsVejyQ6kyJ9M6XC+YuyBnEcMra8lmSd7AD9HRCWL24oJr8TEaAbMWvjWkyE
         d3CFRMK4i4jTm06lePDGtA6RYYAGGzCT+6XQhKqnDpJOVWN8FTnSSC7f5LgCPOklgHb2
         QQaA==
X-Gm-Message-State: AFq9FYIkvZC0WFW0G60W2amCnTTsbqFuVD1WyeUMfzlkdu88zzwpgB8F
	DuTjkHKhLvORVHOoP6x/QUdyzHfkr9uymE//uZaTkAg74mv2364zuNN0hTZPmMWeYJs=
X-Gm-Gg: AYBFou2jZTjJbq8ZwAkA7YcPh7vmPkY/qfjBIQBbs5tI8gcRMP1qUIK4Y1BseX4GDKJ
	keSpWBM8Ap1S1ZlrGRe1gPYA2w+1L127zGeNMI0OskdO1h1klUqLqlO9IhQ8+v21wBGqvB7e0r8
	cPd1j/Xb5gfutdcwtyHd6BCcdJb4DgybUgwCGc5yWPA5Ks0MIEwVCyOSwhzFKnY/zGQC+9/7t6/
	qbi3eN+1jXASGMrvNVJAZDw2jsyjQLY3EXsIyxY6TBksbqvOrvIDByJsvqD2qEx9vLpsxef+pGC
	H5ygf/cPy2dWFRZyUZBUDZg2/F02pKS5rb3gpMs9CNCQLfZLM5Rd5Nzk7RU8j9b60xraX4vnpV4
	/x8dFzPA02FUCUaPkwc81+KWlaG1qVEerrfFV3SFKdrA2WH1nAXRiaAstcNdRcvPahxIJOsoQNV
	xDKimlm8SHPYqIHT2b/ymIDJNKj2pep4pmw6j0CAcykQdfLLruBdrcW/A7NHsydQbvZcxl3bgxd
	5aC+NXdurPhwWTHYELFr4VvMg==
X-Received: by 2002:a05:620a:29d5:b0:93e:acdd:c9b1 with SMTP id af79cd13be357-93ebd1b7152mr3243147485a.19.1792092730120;
        Thu, 15 Oct 2026 12:32:10 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.245])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbaae645sm3482366d6.21.2026.10.15.12.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:32:09 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 15 Oct 2026 19:30:54 +0000
Subject: [PATCH 30/43] io_uring/timeout: keep repeat count on multishot
 update
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-io-uring-fixes-v1-30-c1556f5d7bf5@toxicpanda.com>
References: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
In-Reply-To: <20261015-b4-io-uring-fixes-v1-0-c1556f5d7bf5@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792092659; l=1328;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=+m4ft+wbuLYwFbvEiboS793/e6kDgJNCTWHIuhFdhwg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDhzKUxcVX2rIpNVzLIBxh0GIZgzByNN4iFYV9GH24kg4Cf69k7mbPr6rtv9+0lcnkq4IuLXUiJ
 4hdVBq+uEzQM=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

IORING_TIMEOUT_UPDATE clears ->off of the timeout it updates, to turn a
timeout that waits for a number of completions into a pure one. For a
multishot timeout ->off isn't a sequence though, it tells whether the
number of repeats is limited: io_timeout_finish() only looks at
->repeats if ->off is set.

A multishot timeout that was set up to fire N times hence fires forever
once its interval has been updated. Leave ->off alone for those, they are
never treated as sequence timeouts anyway.

Fixes: ea97f6c8558e ("io_uring: add support for multishot timeouts")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 io_uring/timeout.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index 8b65ba20e143..dbcd0242d8f6 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -475,8 +475,10 @@ static int io_timeout_update(struct io_ring_ctx *ctx, __u64 user_data,
 	if (IS_ERR(req))
 		return PTR_ERR(req);
 
-	timeout->off = 0; /* noseq */
 	data = req->async_data;
+	/* for a multishot request this isn't a sequence, keep the repeats */
+	if (!(data->flags & IORING_TIMEOUT_MULTISHOT))
+		timeout->off = 0; /* noseq */
 	data->time = time;
 
 	list_add_tail(&timeout->list, &ctx->timeout_list);

-- 
2.55.0

