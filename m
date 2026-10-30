Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363995;
	b=y2TWjiWidBlD6IyDX6OwiMxXHeyDXQfSIiLA7cFbiZ9tH6sJhxnqQDBbyyjFVARao125
	 Zu6tUHG3FgScrviup+XKhH9HX+BPStfmyfI4kr152oUzKRAtBwP08Arl/8UftQDeqz20V
	 Vm/nXQr98hY9tjKKW7/z5A8VMovikF5CH50xuj/D4d3KnpYN0MDA6B8aXbfi5yjfoANSp
	 bCX/RO4q9v99oSNfDlFX2TsWP3ODZf7DoUEFa04GX9IG2LghfI+YaKWYaOsl129L/JFAD
	 o/ywTPhmMNWIh8KvJeeXNTtyf+Tf1RleLWUjBfaLqzi9ynpxT32MmBjSja7FJxfSoKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1KaBBNRkubak3FMTFfY4sBxEh/vBQKes4YxguyRgqq4=;
	b=ig/67wY+SL8p4waJSTcM3V/XdFBNU4xPIFMaJYsz6s88cI67INxIUMsgxyEYgPIJp1Cs
	 bNFbrxrb25d7Lu729ZSv9V5H7tK8J5EVOuNmg+E3k5RzdoiAc6JztflRQaUW9TxGYw08U
	 2C106pqWTD8iTacehoaTetWiD+ITrDcfChw+4QoJv28SRmaAI3GqBUFqdWzTXMgxyggfw
	 zJHXWbBeBOnmrHc77GPTM6TzI52nDroyNoyJJfjXJnwPwSui+m3uQ6rO3vOVEtVgdV2At
	 NxR8CVmaro3joMIQCi3KfBFR3bCHB2wuIX7+0CNvrex7YFyVnpRDFMsSP3nQsWagaDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ja3ASSH/";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0CC606A322
	for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 12:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B0CC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ja3ASSH/
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4649b35bso622203f8f.3
        for <io-uring@vger.kernel.org>; Fri, 30 Oct 2026 05:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793363994; x=1793968794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1KaBBNRkubak3FMTFfY4sBxEh/vBQKes4YxguyRgqq4=;
        b=ja3ASSH/iE95Go5UBevpUcMxsL/Vg80+7lCs6UIB7u3l3kbsbyrJ6P/8k/5+IFKOvH
         B7yn/tq8CT74wXWyPq36GasVJcMVdc00E1lLzkDx2aWtyyBtfljSRnFAgGKcqps+Hqa3
         lLRxLtBezMavP1A+PBajIBjD4U5aARsjheb4teH5/s3DmOc1tAloAeSHpYeo1wGwIcF8
         gtqShB7RxUgP4oRWpenW27vWc7AXu103TGk3alXPxEu2BOe/2oWQvj8vv23m9KZt1M8V
         CTaZHWH71u08+EbG6tM7pqEIiHeK7qkaiAOY5PlNO6jNQtE2lN5YwrbdS0JVhBIdPYD1
         tlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363994; x=1793968794;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1KaBBNRkubak3FMTFfY4sBxEh/vBQKes4YxguyRgqq4=;
        b=IdvyOuvjG4n0paROPTTyN7hEiFpN1+yzJkX7C8Yai5wTcZY8L8qKzZVenDgW97xGsu
         pmXhpG0TYIJYDbAJtaUb5brsgMeEPvzcHerIYnKdGqljQHPq837nP/oxTj4TtA7129Yq
         +TrA0qqqVMOh1KscgRONMU8xTkFu4eBm13sEx+9EkbAeoS8w0ciKl+NRKpyDNjSluNrJ
         MgV/0no6pFvPk1osKl6KiuOrv2Cv0CwG+4cxlZxRS75LW4xkGIkClRXi+ENZXLQpJlaT
         FUEDLmhTGWo8OofYXmzb3nDL+YKY6X+gvFOB3AdUCFfg8Lqiv6T386Y8Dhmlowhx2iQ7
         zPQg==
X-Forwarded-Encrypted: i=1; AKwUvBwAN2GpP8agCG6VUFyWtZLYd5ha6MakFOdfAytZIP3/S+sy99GBc5qQDQ+HgYOVyvRvNZ01WzQFRg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL2BWJGuNfVMI0iT2WFe9cOATSrOScIoRr5UqfVp7r01Nmb0sB0
	dNnSrMrCiD4N0EAtO5G/vosRHnT0jSNKaeOaAzCZk4TdcnjZq6K2ybxk
X-Gm-Gg: AYBFou2jwveEagMRaQg0D7gRy3ShEgP5LSwCDQ6AtgeuUaGugRij2nGRxUjvMqgKrZN
	VysmL9EFe+w2iT5vd2EbnTN9vlm6cFANQxHyBTY9TBZzWgzFVz9pkT4TMdDtnEKE8m4HPyeMboP
	hpBrdGz9JUe6QVFuPvFZDS2xmNr+Z9QuYXV7bLc+o8KwGX2lic073dJoDEptLutrc90JGV1P7aZ
	+v25BqCjYS16MeYnvEKAfWUj1KIDpv5aw9b+p+aLY/aj2FVcZOO/18UP3dJ9aBWHjKCnSqVbqHQ
	acxjJEalWTozOLCPgvkN8oxuaVi2GAzDG5ZZCLhAcuYgVeoQq0Ag63WTx524uVn6UcU+G2iiFqa
	9vWx3QI32qK/99b6gcds8VdBSgmdynhkWbzSYd/230352APCpd1Gwz14xTznpmTQKz+QsyBG8F0
	HUlf+C5l89mTUFii2XFZR2o1P5RmF1G8z1PQVKazDaKoXXn+ESXl4Onr1zRquj7KJ7LTjgsEEek
	paqw7vA7ZoN9NvtP9OjYhXz65foipw/VcqtwtKRzdQKvc3p+eBLwRWxa364AUjLYe8BnCiM9hnu
	+IAGpq6gThLoT2va8k5p5OfI6EAT7vYOf46OYGSJ3Fgqb6dpysxlKDSw1NV5chdE0PB7w+kBAvf
	hra+IcWzU7Ufb0Y0J5E4=
X-Received: by 2002:a05:6000:184d:b0:48d:fbf2:555f with SMTP id ffacd0b85a97d-48e6e518487mr4939043f8f.55.1793363993996;
        Fri, 30 Oct 2026 05:39:53 -0700 (PDT)
Received: from meven-thinkpad.home (2a01cb088745e00090de407b41070a01.ipv6.abo.wanadoo.fr. [2a01:cb08:8745:e000:90de:407b:4107:a01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm3088971f8f.23.2026.10.30.05.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:39:53 -0700 (PDT)
From: "=?UTF-8?q?M=C3=A9ven=20Car?=" <meven29@gmail.com>
X-Google-Original-From: =?UTF-8?q?M=C3=A9ven=20Car?= <meven@kde.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] fs: add filename_utimensat()
Date: Fri, 30 Oct 2026 13:39:43 +0100
Message-ID: <20261030123945.1704118-2-meven@kde.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030123945.1704118-1-meven@kde.org>
References: <20261030123945.1704118-1-meven@kde.org>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Copy utilities that preserve timestamps, like cp -p or a file manager,
set the times of every copy after its last write. To do that through
io_uring, the request needs the utimensat() lookup on a name that was
imported at submission time.

io_uring takes the path of a request when it is submitted and looks it
up later, from a worker thread. The path ops it already has call the
filename_*() helpers of fs/namei.c with a struct filename. utimensat(2)
had no such helper: do_utimes_path() took the user pointer and imported
the name itself.

Split the lookup and the vfs_utimes() call out of do_utimes_path() into
filename_utimensat(), declared in fs/internal.h next to the other
filename_*() helpers. do_utimes_path() now only imports the name.

Signed-off-by: Méven Car <meven@kde.org>
---
 fs/internal.h |  2 ++
 fs/utimes.c   | 12 +++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index c658c8a5ebd5..985b2bc5895e 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -63,6 +63,8 @@ int filename_mknodat(int dfd, struct filename *name, umode_t mode, unsigned int
 int filename_symlinkat(struct filename *from, int newdfd, struct filename *to);
 int filename_linkat(int olddfd, struct filename *old, int newdfd,
 			struct filename *new, int flags);
+int filename_utimensat(int dfd, struct filename *name,
+		       struct timespec64 *times, int flags);
 int vfs_tmpfile(struct mnt_idmap *idmap,
 		const struct path *parentpath,
 		struct file *file, umode_t mode);
diff --git a/fs/utimes.c b/fs/utimes.c
index e22664e4115f..8072f05ac8dc 100644
--- a/fs/utimes.c
+++ b/fs/utimes.c
@@ -79,8 +79,8 @@ int vfs_utimes(const struct path *path, struct timespec64 *times)
 }
 EXPORT_SYMBOL_GPL(vfs_utimes);
 
-static int do_utimes_path(int dfd, const char __user *filename,
-		struct timespec64 *times, int flags)
+int filename_utimensat(int dfd, struct filename *name,
+		       struct timespec64 *times, int flags)
 {
 	struct path path;
 	int lookup_flags = 0, error;
@@ -91,7 +91,6 @@ static int do_utimes_path(int dfd, const char __user *filename,
 	if (!(flags & AT_SYMLINK_NOFOLLOW))
 		lookup_flags |= LOOKUP_FOLLOW;
 
-	CLASS(filename_uflags, name)(filename, flags);
 retry:
 	error = filename_lookup(dfd, name, lookup_flags, &path, NULL);
 	if (error)
@@ -105,6 +104,13 @@ static int do_utimes_path(int dfd, const char __user *filename,
 	return error;
 }
 
+static int do_utimes_path(int dfd, const char __user *filename,
+		struct timespec64 *times, int flags)
+{
+	CLASS(filename_uflags, name)(filename, flags);
+	return filename_utimensat(dfd, name, times, flags);
+}
+
 static int do_utimes_fd(int fd, struct timespec64 *times, int flags)
 {
 	if (flags)
-- 
2.56.0

